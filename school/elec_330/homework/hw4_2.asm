	Title "IP6-4: Finding Max Temperature"
	list p=18f452, f =inhx32
	#include <p18f452.inc>		;the header file

reg0	equ 	0x00			;define data registers
buffer 	equ	0x10

	org	0x00			;reset vector
	goto	start

	org	0x20
start:	clrf	reg0			;init reg0
	lfsr	FSR0,buffer		;init pointer
next:	movf	POSTINC0,w 		;copy data byte to WREG
	bz	finish			;data = 0?
	btfsc	WREG,7			;data > 0?
	bra	next
	cpfslt	reg0			;reg0 < data?
	bra	next
	movwf	reg0			;save larger data
	bra	next			;go back and check next byte
finish	sleep
	end
