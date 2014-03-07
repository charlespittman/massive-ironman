	Title "PIC18F452 IP5-6 Data Copy"
	list p=18f452, f =inhx32
	#include <p18f452.inc>		;header file

buffer 	equ	0x10			;begin data registers
counter	equ	0x01			;counter is reg01

	org	0x00			;reset vector
	goto	start

	org	0x20
start:	movlw	0x00			;init PORTC as an output port
	movwf	TRISC
	movlw	0x05			;init counter=5
	movwf	counter
	lfsr	FSR0,buffer		;init fsr0 pointer
	movlw	upper source		;init table pointer
	movwf	TBLPTRU
	movlw	high source
	movwf	TBLPTRH
	movlw	low source
	movwf	TBLPTRL
next:	tblrd*+				;copy byte to table latch and inc table pointer
	movf	TABLAT,w 		;copy byte to w
	movwf	POSTINC0		;copy byte to data register and inc FSR0
	decf	counter,f		;decrement counter
	bnz	next			;counter=0?
	movlw	0xff			;load completion indicator
	movwf	PORTC			;turn on all leds at portc
	sleep

	org	0x50			;data bytes
source:	db	0xf6,0x67,0x7f,0xa9,0x72

	end
