;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;this program implements a microwave oven controller.  a time is set using
;the matrix keypad.  time is counted down and displayed on two seven-segment
;leds.  other leds indicate cooking status.
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

              title "Microwave"
              list  p=18f452, f =inhx32
              #include <p18f452.inc>		;header file for pic18f452

;;
;; Registers
ZERO:         equ   0x00            ; zero register

BCD0:         equ   0x01            ; time low BCD digit
BCD1:         equ   0x02            ; time high BCD digit

TEMP:         equ   0x10            ; temporary register for getcode

KYSOPEN:      equ   0x11            ; code register for all keys open

START:        equ   0x12            ; code register for start
STOP:         equ   0x13            ; code register for stop
DOOR:         equ   0x14            ; code register for door

BUZZ:         equ   0x15            ; code register for buzzer
MAG:          equ   0x16            ; code register for magnitron

scale:        equ   0xc0            ; scale for timer0

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
              movlw scale           ; low count
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

              movlw 0x01            ; code for magnetron
              movwf MAG

              movlw 0x00            ; code for buzzer
              movwf BUZZ

              ;; init ports a,c,d as output ports
              movlw 0x00
              movwf TRISA
              movwf TRISC
              movwf TRISD

              ;; init leds off
              movlw 0x00
              movwf PORTA

              ;; init 7-seg leds off
              movlw 0xff
              movwf PORTD
              movwf PORTC

              ;; init time=0
              clrf  BCD0
              clrf  BCD1

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
c_loop:
              call  cook            ; cooking
              bra   i_loop


;;; Function: INPUT gets user input for time.
;;; Input:
;;; Output: time in BCD1
;;; Alters:
;;; Calls: keychk, outled
;;; Notes:
input:
              ;; keychk returns either 0x80 or the KPAD value of button pressed
              ;; 0x80 should trip the negative flag in STATUS
              call  keychk
              bn    input
              movwf BCD1
              call outled
              return

;;; Function: COOK checks for stop and door buttons, then lights magnetron.
;;; Input: STOP, DOOR
;;; Output: MAG
;;; Alters: WREG, MAG
;;; Calls:
;;; Notes:
cook:

              return

;;; Function: TMR0_ISR resets TIMER0, decrements time, and calls outled.
;;; Input:
;;; Output:
;;; Alters:
;;; Calls: outled
;;; Notes:
tmr0_isr:
              movlw scale           ; low count
              movwf TMR0L           ; load low count in timer0
              bcf   INTCON,TMR0IF   ; clear timr0 overflow flag & reset timer



              retfie FAST           ; return

;;; Function: KEYCHK checks that all keys are open, then calls keycode
;;; Input: PORTB
;;; Output: 0x80 if no keys pressed, or the result of keycode
;;; Alters: WREG, PORTB
;;; Calls: keycode
;;; Notes:
keychk:
              movlw 0x0f            ; set rb0-rb3 hi
              movwf PORTB
              movf  PORTB, w        ; read PORTB

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
;;; Calls:
;;; Notes:
keycode:
              ;; Scan column RB0
colrb0:       movlw 0x00
              andwf PORTB, f        ; all other keys should be 0s
setrb0:       bsf   PORTB, 0        ; set column - rb0

keyb0_4:
              btfss PORTB, 4        ; check rb4, if = 1, find code
              bra   keyb0_5         ; if rb4 = 0, check next key
              movlw KPAD_1
              return

keyb0_5:
              btfss PORTB, 5        ; check rb5, if = 1, find code
              bra   keyb0_6         ; if rb5 = 0, check next key
              movlw KPAD_4
              return

keyb0_6:
              btfss PORTB, 6        ; check rb6, if = 1, find code
              bra   keyb0_7         ; if rb6 = 0, check next key
              movlw KPAD_7
              return

keyb0_7:
              btfss PORTB, 7        ; check rb7, if = 1, find code
              bra   colrb1          ; if rb7 = 0, go to next column
              movlw KPAD_A
              return

              ;; Scan column RB1
colrb1:       movlw 0x00
              andwf PORTB, f        ; all other keys should be 0s
setrb1:       bsf   PORTB, 1        ; set column - rb1

keyb1_4:
              btfss PORTB, 4        ; check rb4, if = 1, find code
              bra   keyb1_5         ; if rb4 = 0, check next key
              movlw KPAD_2
              return

keyb1_5:
              btfss PORTB, 5        ; check rb5, if = 1, find code
              bra   keyb1_6         ; if rb5 = 0, check next key
              movlw KPAD_5
              return

keyb1_6:
              btfss PORTB, 6        ; check rb6, if = 1, find code
              bra   keyb1_7         ; if rb6 = 0, check next key
              movlw KPAD_8
              return

keyb1_7:
              btfss PORTB, 7        ; check rb7, if = 1, find code
              bra   colrb2          ; if rb7 = 0, go to next column
              movlw KPAD_0
              return

              ;; Scan column RB2
colrb2:       movlw 0x00
              andwf PORTB, f        ; all other keys should be 0s
setrb2:       bsf   PORTB, 2        ; set column - rb2

keyb2_4:
              btfss PORTB, 4        ; check rb4, if = 1, find code
              bra   keyb2_5         ; if rb4 = 0, check next key
              movlw KPAD_3
              return

keyb2_5:
              btfss PORTB, 5        ; check rb5, if = 1, find code
              bra   keyb2_6         ; if rb1 = 5, check next key
              movlw KPAD_6
              return

keyb2_6:
              btfss PORTB, 6        ; check rb6, if = 1, find code
              bra   keyb2_7         ; if rb6 = 0, check next key
              movlw KPAD_9
              return

keyb2_7:
              btfss PORTB, 7        ; check rb7, if = 1, find code
              bra   colrb3          ; if rb7 = 0, go to next column
              movlw KPAD_B
              return

              ;; Scan column RB3
colrb3:       movlw 0x00
              andwf PORTB, f        ; all other keys should be 0s

setrb3:       bsf   PORTB, 3        ; set column - rb3

keyb3_4:
              btfss PORTB, 4        ; check rb4, if = 1, find code
              bra   keyb3_5         ; if rb4 = 0, check next key
              movlw KPAD_C
              return

keyb3_5:
              btfss PORTB, 5        ; check rb5, if = 1, find code
              bra   keyb3_6         ; if rb5 = 0, check next key
              movlw KPAD_D
              return

keyb3_6:
              btfss PORTB, 6        ; check rb6, if = 1, find code
              bra   keyb3_7         ; if rb6 = 0, check next key
              movlw KPAD_E
              return

keyb3_7:
              btfss PORTB, 7        ; check rb7, if = 1, find code
              bra   rtn             ; if rb7 = 0, go to next column
              movlw KPAD_F

rtn:          return

;;; Function: OUTLED displays digits on LEDs.
;;; Input: Unpacked BCD digits in BCD1, BCD0
;;; Output: BCD digits at PORTD, PORTC
;;; Alters: WREG
;;; Calls: getcode
;;; Notes:
outled:
              ;; Copy low-order BCD digit to WREG, and display it at PORTC.
              movf  BCD0, w
              call  getcode
              movff TABLAT, PORTC

              ;; Copy high-order BCD digit to WREG, and display it at PORTD.
              movf  BCD1, w
              call  getcode
              movff TABLAT, PORTD

              return

;;; Function: GETCODE gets unpacked digit from WREG and stores its 7-segment
;;;           code in TABLAT.
;;; Input: Unpacked digit in WREG
;;; Output: 7-segment code in TABLAT
;;; Alters: WREG
;;; Calls:
;;; Notes:
getcode:
              ;; Copy BCD digit to be displayed
              movwf TEMP

              ;; Copy 21-bit address of ledcode to table pointer
              movlw upper ledcode
              movwf TBLPTRU
              movlw high ledcode
              movwf TBLPTRH
              movlw low ledcode
              movwf TBLPTRL

              ;; Add BCD digit to table pointer
              movf  TEMP, w
              addwf TBLPTRL, f

              ;; Copy ledcode to table TABLAT
              tblrd*

              return

ledcode:
              db    0xc0, 0xf9, 0xa4, 0xb0, 0x99 ; code for digits 0 to 4
              db    0x92, 0x82, 0xf8, 0x80, 0x90 ; code for digits 5 to 9

              end
