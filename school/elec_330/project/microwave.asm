;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;this program implements a microwave oven controller.  a time is set using
;the matrix keypad.  time is counted down and displayed on two seven-segment
;leds.  other leds indicate cooking status.
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

 	title "Microwave"
 	list p=18f452, f =inhx32
 	#include <p18f452.inc>		;header file for pic18f452

zero		equ	0x00		;zero register
bcd0		equ	0x01		;time low bcd digit
bcd1		equ	0x02		;time high bcd digit
temp		equ	0x10		;temporary register for getcode
kysopen		equ	0x11		;code register for all keys open
start		equ	0x12		;code register for start
stop		equ	0x13		;code register for stop
door		equ	0x14		;code register for door
buzz		equ	0x15		;code register for buzzer
mag		equ	0x16		;code register for magnitron
scale		equ	0xc0		;scale for timer0

	org	00		;begin assembly
	goto	main		;program begins at 0020h

	org	0x08
	goto 	tmr0_isr	;timer0 interrupt vector

	org	0x20
main: 		movlw	b'11100000'	;init timer0:interrupt enable
	movwf	intcon
	movlw	b'01000100'	;timer0:8-bit,internal clock,prescale-1:32
	movwf	t0con
	movlw	scale		;low count
	movwf	tmr0l		;load low count in timer0
	bcf 	intcon,tmr0if	;clear timr0 overflow flag � reset timer
	movlw	0xf0		;enable rb7-rb4 as input and rb3-rb0 as output
	movwf	trisb
	clrf	zero		;code for zero
	movlw	0x0f		;code when all keys are open
	movwf	kysopen
	movlw	0x0f		;code for start
	movwf	start
	movlw			;code for stop
	movwf	stop
	movlw			;code for door open
	movwf	door
	movlw			;code for magnetron
	movwf	mag
	movlw			;code for buzzer
	movwf	buzz
			  	;init ports a,c,d as output ports


				;init leds off
				;init 7-seg leds off

	clrf	bcd0		;init time=0
	clrf	bcd1
i_loop:
        call	input		;call input to get time
	call	keychk		;check for start
	cpfseq	start
	bra	i_loop

c_start:
        bsf	t0con,tmr0on	;enable timer0

c_loop:
        call	cook		;cooking

	bra	i_loop

;;;
;;; Function: Gets user input for time.
;;; Input:
;;; Output: time in BCD1
;;; Alters:
;;; Calls: keychk, outled
;;; Notes:
input:

	return

;;;
;;; Function: Checks for Stop and Door, and lights magnetron.
;;; Input: stop, door
;;; Output: magnetron
;;; Alters:
;;; Calls:
;;; Notes:
cook:

	return

;;;
;;; Function: Resets TIMER0, decrements time, and calls outled
;;; Input:
;;; Output:
;;; Alters:
;;; Calls: outled
;;; Notes:
tmr0_isr:
	movlw	scale		;low count
	movwf	tmr0l		;load low count in timer0
	bcf 	intcon,tmr0if	;clear timr0 overflow flag � reset timer



	retfie	fast		;return
;;;
;;; Function: Checks that all keys are open, then calls keycode
;;; Input:
;;; Output: Sets bit 7 if all keys are open
;;; Alters:
;;; Calls: keycode
;;; Notes:
keychk:
	movlw	0x0f		;set rb0-rb3 hi
	movwf	portb
	movf	portb,w		;read portb
	cpfseq 	kysopen		;are all keys open?
	bra	keycode
	movlw	b'10000000'	;return a 1 in bit7 if all open
	return

;;;
;;; Function: Encodes key and identifies key position
;;; Input:
;;; Output: Encoded key position in WREG.
;;; Alters:
;;; Calls:
;;; Notes:
keycode:

colrb0:
        movlw	0x00		;get ready to scan column rb0
	andwf	portb, f	;all other keys should be 0s
setrb0:	bsf	portb, 0	;set column - rb0

keyb04:
        btfss 	portb, 4	;check rb4, if = 1, find code
	bra	keyb05 		;if rb4 = 0, check next key
	movlw	0x01		;code for key '1'
	return

keyb05:	btfss	portb, 5 	;check rb5, if = 1, find code
	bra	keyb06		;if rb5 = 0, check next key
	movlw	0x04		;code for key '4'
	return

keyb06:	btfss	portb, 6 	;check rb6, if = 1, find code
	bra	keyb07		;if rb6 = 0, check next key
	movlw	0x07		;code for key '7'
	return

keyb07:	btfss	portb, 7 	;check rb7, if = 1, find code
	bra	colrb1		;if rb7 = 0, go to next column
	movlw	0x0a		;code for key 'a'
	return

colrb1:	movlw	0x00		;get ready to scan column rb1
	andwf	portb, f	;all other keys should be 0s

setrb1:	bsf	portb, 1	;set column - rb1

keyb14:	btfss 	portb, 4	;check rb4, if = 1, find code
	bra	keyb15 		;if rb4 = 0, check next key
	movlw	0x02		;code for key '2'
	return

keyb15:	btfss	portb, 5 	;check rb5, if = 1, find code
	bra	keyb16		;if rb5 = 0, check next key
	movlw	0x05		;code for key '5'
	return

keyb16:	btfss	portb, 6 	;check rb6, if = 1, find code
	bra	keyb17		;if rb6 = 0, check next key
	movlw	0x08		;code for key '8'
	return

keyb17:	btfss	portb, 7 	;check rb7, if = 1, find code
	bra	colrb2		;if rb7 = 0, go to next column
	movlw	0x00		;code for key '0'
	return

colrb2:	movlw	0x00		;get ready to scan column rb2
	andwf	portb, f	;all other keys should be 0s

setrb2:	bsf	portb, 2	;set column - rb2

keyb24:	btfss 	portb, 4	;check rb4, if = 1, find code
	bra	keyb25 		;if rb4 = 0, check next key
	movlw	0x03		;code for key '3'
	return

keyb25:	btfss	portb, 5 	;check rb5, if = 1, find code
	bra	keyb26		;if rb1 = 5, check next key
	movlw	0x06		;code for key '6'
	return

keyb26:	btfss	portb, 6 	;check rb6, if = 1, find code
	bra	keyb27		;if rb6 = 0, check next key
	movlw	0x09		;code for key '9'
	return

keyb27:	btfss	portb, 7 	;check rb7, if = 1, find code
	bra	colrb3		;if rb7 = 0, go to next column
	movlw	0x0b		;code for key 'b'
	return

colrb3:	movlw	0x00		;get ready to scan column rb3
	andwf	portb, f	;all other keys should be 0s

setrb3:	bsf	portb, 3	;set column - rb3

keyb34:	btfss 	portb, 4	;check rb4, if = 1, find code
	bra	keyb35 		;if rb4 = 0, check next key
	movlw	0x0c		;code for key 'c'
	return

keyb35:	btfss	portb, 5 	;check rb5, if = 1, find code
	bra	keyb36		;if rb5 = 0, check next key
	movlw	0x0d		;code for key 'd'
	return

keyb36:	btfss	portb, 6 	;check rb6, if = 1, find code
	bra	keyb37		;if rb6 = 0, check next key
	movlw	0x0e		;code for key 'e'
	return

keyb37:	btfss	portb, 7 	;check rb7, if = 1, find code
	bra	rtn		;if rb7 = 0, go to next column
	movlw	0x0f		;code for key 'f'

rtn:
        return

;;;
;;; Function: Displays digits on LEDs.
;;; Input: Unpacked BCD digits in BCD1, BCD0
;;; Output: BCD digits at PORTD, PORTC
;;; Alters:
;;; Calls: getcode
;;; Notes:
outled:
	movf	bcd0,w		;get low-order bcd digit in w
	call	getcode		;find its seven-segment code
	movff 	tablat,portc 	;display it at portc
 	movf	bcd1,w		;get high-order bcd
 	call	getcode		;get its code
 	movff	tablat,portd	; display at portd
 	return

;;;
;;; Function: Gets unpacked digit from WREG and stores its 7-segment code in TABLAT.
;;; Input: Unpacked digit in WREG
;;; Output: 7-segment code in TABLAT
;;; Alters:
;;; Calls:
;;; Notes:
getcode:
        movwf	temp

	movlw	upper ledcode	;copy upper 5 bits in table pointer of
 	movwf	tblptru		;21_bit address of ledcode
 	movlw	high ledcode	;copy high 8 bit in table pointer
 	movwf	tblptrh
 	movlw	low ledcode	;copy low 8 bits in table pointer
 	movwf	tblptrl
 	movf	temp,w		;get bcd number to be displayed
 	addwf	tblptrl,f 	;add bcd number to table pointer
 	tblrd*			;read led code from memory
	return

ledcode:
	db	0xc0, 0xf9, 0xa4, 0xb0, 0x99 ; code for digits 0 to 4
 	db	0x92, 0x82, 0xf8, 0x80, 0x90 ; code for digits 5 to 9

	end
