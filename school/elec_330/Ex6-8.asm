	Title "PIC18F452 Ex6-8 Unpacking a Byte"
	List p=18F452, f =inhx32
	#include <p18F452.inc>	;The header file

BCD0	EQU	0x10		;Define data register addresses
BCD1	EQU	0X11
REG1	EQU	0x01

	ORG	0x00
	GOTO	START

	ORG	0x20		;Begin assembly at 0020H
START:	MOVLW	0x37		;Load the packed byte
	MOVWF	REG1		;Save packed byte in REG1
	ANDLW	0x0F		;Mask high-order nibble
	MOVWF	BCD0		;Save low-order nibble in BCD0
	MOVF	REG1,W		;Get the byte again
	ANDLW	0xF0		;Mask low-order nibble
	RRNCF	WREG,W		;Rotate high-order nibble four times
	RRNCF	WREG,W
	RRNCF	WREG,W
	RRNCF	WREG,W
	MOVWF	BCD1		;Save high-order nibble in BCD1
	SLEEP
	END

