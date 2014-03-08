	Title "PIC18F452 IP5-6 Data Copy"
	list p=18f452, f =inhx32
	#include <p18f452.inc>		;header file

buffer:         equ     0x20                ;results
counter:        equ	0x01			;counter is reg01

	org	0x00			;reset vector
	goto	start

	org	0x40
start:
        movlw	0x00			;init PORTC as an output port
	movwf	TRISC
	movlw	0x06
	movwf	counter
	lfsr	FSR0,buffer		;init fsr0 pointer
	movlw	upper source		;init table pointer
	movwf	TBLPTRU
	movlw	high source
	movwf	TBLPTRH
	movlw	low source
	movwf	TBLPTRL
next:
	tblrd*+				;copy byte to table latch and inc table pointer
	decf	counter,f		;decrement counter
        bn      loaded                  ;counter goes negative if last item of source isn't copied to buffer
	movf	TABLAT,w 		;copy byte to w
	bnn     next
	movwf	POSTINC0		;copy byte to data register and inc FSR0
	bnz	next			;counter=0?

loaded:
        movlw	0xff			;load completion indicator
	movwf	PORTC			;turn on all leds at portc
	sleep

	org	0x80			;data bytes
source:
        db	0xe3,0x72,0x5d,0x81,0xcc,0x34

	end
