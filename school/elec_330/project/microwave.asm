;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;this program implements a microwave oven controller.  a time is set using
;the matrix keypad.  time is counted down and displayed on two seven-segment
;leds.  other leds indicate cooking status.
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

              title "Microwave"
              list  p=18f452, f =inhx32
              #include <p18f452.inc>		;header file for pic18f452

;; Registers
ZERO:         equ   0x00            ; zero register
NINE:         equ   0x09            ; reset for seconds

BCD0:         equ   0x01            ; time low BCD digit
BCD1:         equ   0x02            ; time high BCD digit

TIMEUP:       equ   0x03            ; time = 0
TEST:         equ   0x04

TEMP:         equ   0x10            ; temporary register for getcode

KYSOPEN:      equ   0x11            ; code register for all keys open

START:        equ   0x12            ; code register for start
STOP:         equ   0x13            ; code register for stop
DOOR:         equ   0x14            ; code register for door

BUZZ:         equ   0x15            ; code register for buzzer
MAG:          equ   0x16            ; code register for magnitron

SCALE:        equ   0xc0            ; scale for timer0

;; Constants used for identifying keypad buttons
KPAD_0:       equ   0x00            ; code for key '0'
KPAD_1:       equ   0x01            ; code for key '1'
KPAD_2:       equ   0x02            ; code for key '2'
KPAD_3:       equ   0x03            ; code for key '3'
KPAD_4:       equ   0x04            ; code for key '4'
KPAD_5:       equ   0x05            ; code for key '5'
KPAD_6:       equ   0x06            ; code for key '6'
KPAD_7:       equ   0x07            ; code for key '7'
KPAD_8:       equ   0x08            ; code for key '8'
KPAD_9:       equ   0x09            ; code for key '9'
KPAD_A:       equ   0x0a            ; code for key 'a'
KPAD_B:       equ   0x0b            ; code for key 'b'
KPAD_C:       equ   0x0c            ; code for key 'c'
KPAD_D:       equ   0x0d            ; code for key 'd'
KPAD_E:       equ   0x0e            ; code for key 'e'
KPAD_F:       equ   0x0f            ; code for key 'f'

;; Begin assembly
              org   0x00
              goto  main

;; High-priority Interrupts
              org   0x08
              goto  tmr0_isr

;; Main program
              org   0x20
main:
              movlw b'11100000'     ; init timer0:interrupt enable
              movwf INTCON

              movlw b'01000100'     ; timer0:8-bit,internal clock,prescale-1:32
              movwf T0CON

              movlw SCALE           ; low count
              movwf TMR0L           ; load low count in timer0
              bcf   INTCON,TMR0IF   ; clear timr0 overflow flag & reset timer

              movlw 0xf0            ; enable rb7-rb4 as input and rb3-rb0 as output
              movwf TRISB
              clrf  ZERO            ; code for zero

              ;; Initialize status registers
              movlw 0x0f            ; code when all keys are open
              movwf KYSOPEN

              movlw KPAD_F          ; code for start
              movwf START

              movlw KPAD_A          ; code for stop
              movwf STOP

              movlw KPAD_B          ; code for door open
              movwf DOOR

              movlw 0x02            ; code for magnetron
              movwf MAG

              movlw 0x01            ; code for buzzer
              movwf BUZZ

              movlw 0x09            ; code for seconds reset
              movwf NINE

              ;; init ports a,c,d as output ports
              clrf  TRISA
              clrf  TRISC
              clrf  TRISD

              ;; init leds off
              clrf  PORTA

              ;; init 7-seg leds off
              setf  PORTD
              setf  PORTC

              ;; init time=0
              clrf  BCD0
              clrf  BCD1

              clrf  TIMEUP

;; Input loop
i_loop:
              call  input           ; call input to get time
              call  keychk          ; check for start
              cpfseq START
              bra   i_loop

;; Cook start
c_start:
              bsf   T0CON,TMR0ON    ; enable timer0

;; Cook loop
c_loop:       ;; To avoid having to check BCD1 and BCD0 separately when checking
              ;; for time=0, we can add them and check the result (since 0+0=0).
              ;; This should be (and is) set in the timer0 interrupt, so this
              ;; block probably isn't necessary, but after breaking the project
              ;; numerous times, I'm afraid to take anything out.
              movff BCD1, TIMEUP
              movf  BCD0,W
              addwf TIMEUP,F

              call  cook            ; cooking

              ;; Done cooking.  Reset display.
              clrf  BCD0
              clrf  BCD1
              call  outled

door_chk:     ;; Keep checking for the door until it's opened.
              call  keychk
              cpfseq DOOR
              bra   door_chk

door_open:    ;; Kill buzzer and magnetron
              clrf  PORTA

              ;; Wait for the door to reset
              call  keychk
              btfsc WREG,7
              bra   door_open

              bra   i_loop          ; Ready for the next session

;;; Function: INPUT gets user input.
;;; Input: Keypad matrix at PORTB
;;; Output: time in BCD1 and/or button pressed
;;; Alters: BCD1, TEST
;;; Calls: keychk, outled
input:        ;; keychk returns either 0x80 or the KPAD value of button pressed
              ;; 0x80 should trip the negative flag in STATUS
              call  keychk
              btfsc WREG,7
              return

              ;; INPUT kept overwriting BCD1 when checking for control signals,
              ;; so I tried setting BCD1 only when a number was received.
              ;; Something, somewhere kept triggering the reset, so I eventually
              ;; just copied BCD1 to a temp variable and ignored zeroes, as well.

              ;; If input is a number, display it.
              cpfslt NINE
              bra cpy_bcd1
              return

cpy_bcd1:
              movwf TEST
              tstfsz TEST
              movwf BCD1            ; Only 1-9 gets copied back to BCD1 but zero
              call  outled          ; still triggers a display update
              return

;;; Function: COOK checks for stop and door buttons, then lights magnetron.
;;; Input: STOP, DOOR
;;; Output: MAG
;;; Alters: WREG, MAG
;;; Calls: keychk
cook:         ;; Check if we ran out of time, if not, enable timer
              movf  TIMEUP,F
              bz    stop_cook
              bsf   T0CON,TMR0ON    ; start timer0

              call  keychk
              cpfseq STOP
              bra   mag_on
              bra   stop_cook

mag_on:       ;; Enable magnetron unless door's open
              movff MAG,PORTA
              call keychk
              cpfseq DOOR
              bra   cook

pause:        ;; Stop timer and magnetron
              bcf   T0CON,TMR0ON    ; stop timer0
              clrf  PORTA

              ;; If no keys are pressed, then door was closed
              call  keychk
              btfsc WREG,7
              bra   re_cook

              ;; Stay paused if door's open
              cpfseq DOOR
              bra   stop_check
              bra   pause

stop_check:   ;; Check if STOP pressed
              cpfseq STOP
              bra   pause
              bra   stop_cook

re_cook:      ;; Come back from pause
              bsf   T0CON,TMR0ON    ; start timer0
              bra   cook

stop_cook:    ;; Kill timer and magnetron.  Start the buzzer, and go back to main.
              bcf   T0CON,TMR0ON    ; stop timer0
              movff BUZZ,PORTA
              return

;;; Function: TMR0_ISR resets TIMER0, decrements time, and calls outled.
;;; Input: SCALE
;;; Output: current countdown in BCD1 and BCD0, BUZZ (when time=0)
;;; Alters: BCD0, BCD1, TIMEUP
;;; Calls: outled
;;; Notes: This generates an interrupt everytime SCALE overflows, and is meant to
;;;        simulate a second in realtime.
tmr0_isr:
              movlw SCALE           ; low count
              movwf TMR0L           ; load low count in timer0
              bcf   INTCON,TMR0IF   ; clear timr0 overflow flag & reset timer

countdown:    ;; If BCD=0 && BCD1=0, call buzzer and leave.
              movf  BCD0,F
              bnz   dec_bcd0
              movf  BCD1,F
              bz    time_up

              ;; Change BCD0 to 9 and decrement BCD1
              movlw NINE
              movwf BCD0
              decf  BCD1,F
              bra   update_disp

dec_bcd0:     decf  BCD0,F

update_disp:
              call  outled
              bra   leave_timer

time_up:      ;; Kill magnetron, and start buzzing
              movff BUZZ, PORTA
              clrf  TIMEUP

leave_timer:
              movff BCD1, TIMEUP
              movf  BCD0,W
              addwf TIMEUP,F        ; add BCD1 and BCD0 to allow timer=0 check
              retfie FAST           ; return

;;; Function: KEYCHK checks that all keys are open, then calls keycode
;;; Input: PORTB
;;; Output: 0x80 if no keys pressed, or the result of keycode
;;; Alters: WREG, PORTB
;;; Calls: keycode
keychk:
              movlw 0x0f            ; set rb0-rb3 hi
              movwf PORTB
              movf  PORTB,W        ; read PORTB

              ;; Trip negative flag if no keys are currently pressed, otherwise
              ;; call keycode to get button pressed.
              cpfseq KYSOPEN        ; are all keys open?
              bra   keycode
              movlw b'10000000'     ; return a 1 in bit7 if all open
              return

;;; Function: KEYCODE encodes key and identifies key position
;;; Input: PORTB
;;; Output: Encoded key position in WREG.
;;; Alters: WREG
keycode:
              ;; Scan column RB0
colrb0:       movlw 0x00
              andwf PORTB,F        ; all other keys should be 0s
setrb0:       bsf   PORTB,0        ; set column - rb0

keyb0_4:      btfss PORTB,4        ; check rb4, if = 1, find code
              bra   keyb0_5         ; if rb4 = 0, check next key
              movlw KPAD_1
              return

keyb0_5:      btfss PORTB,5        ; check rb5, if = 1, find code
              bra   keyb0_6         ; if rb5 = 0, check next key
              movlw KPAD_4
              return

keyb0_6:      btfss PORTB,6        ; check rb6, if = 1, find code
              bra   keyb0_7         ; if rb6 = 0, check next key
              movlw KPAD_7
              return

keyb0_7:      btfss PORTB,7        ; check rb7, if = 1, find code
              bra   colrb1          ; if rb7 = 0, go to next column
              movlw KPAD_A
              return

              ;; Scan column RB1
colrb1:       movlw 0x00
              andwf PORTB,F        ; all other keys should be 0s
setrb1:       bsf   PORTB,1        ; set column - rb1

keyb1_4:      btfss PORTB,4        ; check rb4, if = 1, find code
              bra   keyb1_5         ; if rb4 = 0, check next key
              movlw KPAD_2
              return

keyb1_5:      btfss PORTB,5        ; check rb5, if = 1, find code
              bra   keyb1_6         ; if rb5 = 0, check next key
              movlw KPAD_5
              return

keyb1_6:      btfss PORTB,6        ; check rb6, if = 1, find code
              bra   keyb1_7         ; if rb6 = 0, check next key
              movlw KPAD_8
              return

keyb1_7:      btfss PORTB,7        ; check rb7, if = 1, find code
              bra   colrb2          ; if rb7 = 0, go to next column
              movlw KPAD_0
              return

              ;; Scan column RB2
colrb2:       movlw 0x00
              andwf PORTB,F        ; all other keys should be 0s
setrb2:       bsf   PORTB,2        ; set column - rb2

keyb2_4:      btfss PORTB,4        ; check rb4, if = 1, find code
              bra   keyb2_5         ; if rb4 = 0, check next key
              movlw KPAD_3
              return

keyb2_5:      btfss PORTB,5        ; check rb5, if = 1, find code
              bra   keyb2_6         ; if rb1 = 5, check next key
              movlw KPAD_6
              return

keyb2_6:      btfss PORTB,6        ; check rb6, if = 1, find code
              bra   keyb2_7         ; if rb6 = 0, check next key
              movlw KPAD_9
              return

keyb2_7:      btfss PORTB,7        ; check rb7, if = 1, find code
              bra   colrb3          ; if rb7 = 0, go to next column
              movlw KPAD_B
              return

              ;; Scan column RB3
colrb3:       movlw 0x00
              andwf PORTB,F        ; all other keys should be 0s

setrb3:       bsf   PORTB,3        ; set column - rb3

keyb3_4:      btfss PORTB,4        ; check rb4, if = 1, find code
              bra   keyb3_5         ; if rb4 = 0, check next key
              movlw KPAD_C
              return

keyb3_5:      btfss PORTB,5        ; check rb5, if = 1, find code
              bra   keyb3_6         ; if rb5 = 0, check next key
              movlw KPAD_D
              return

keyb3_6:      btfss PORTB,6        ; check rb6, if = 1, find code
              bra   keyb3_7         ; if rb6 = 0, check next key
              movlw KPAD_E
              return

keyb3_7:      btfss PORTB,7        ; check rb7, if = 1, find code
              bra   rtn             ; if rb7 = 0, go to next column
              movlw KPAD_F

rtn:          return

;;; Function: OUTLED displays digits on LEDs.
;;; Input: Unpacked BCD digits in BCD1, BCD0
;;; Output: BCD digits at PORTD, PORTC
;;; Alters: WREG
;;; Calls: getcode
outled:       ;; Copy low-order BCD digit to WREG, and display it at PORTC.
              movf  BCD0,W
              call  getcode
              movff TABLAT, PORTC

              ;; Copy high-order BCD digit to WREG, and display it at PORTD.
              movf  BCD1,W
              call  getcode
              movff TABLAT, PORTD

              return

;;; Function: GETCODE gets unpacked digit from WREG and stores its 7-segment
;;;           code in TABLAT.
;;; Input: Unpacked digit in WREG
;;; Output: 7-segment code in TABLAT
;;; Alters: WREG
getcode:      ;; Copy BCD digit to be displayed
              movwf TEMP

              ;; Copy 21-bit address of ledcode to table pointer
              movlw upper ledcode
              movwf TBLPTRU
              movlw high ledcode
              movwf TBLPTRH
              movlw low ledcode
              movwf TBLPTRL

              ;; Add BCD digit to table pointer
              movf  TEMP,W
              addwf TBLPTRL,F

              ;; Copy ledcode to table TABLAT
              tblrd*

              return

ledcode:
              db    0xc0, 0xf9, 0xa4, 0xb0, 0x99 ; code for digits 0 to 4
              db    0x92, 0x82, 0xf8, 0x80, 0x90 ; code for digits 5 to 9

              end
