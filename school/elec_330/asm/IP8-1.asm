;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;Function: BCDBIN subroutine converts a two-digit BCD number into it binary equivalent
; Input:   Two-digit BCD number in WREG                                                                                    :
; Output:   Binary equivalent of the BCD number in WREG
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	Title "IP8-1 BCD to Binary"

	List p=18F452, f =inhx32
	#include <p18F452.inc>	;The header file

BCD0	EQU	0x10		;Define data register addresses
BCD1	EQU	0X11
REG1	EQU	0x01

	ORG	0x00
	GOTO	BCDBIN

	ORG	0x20		;Begin assembly at 0020H
BCDBIN:	MOVWF	REG1		;Save packed byte in REG1
	ANDLW	0x0F		;Mask high-order digit
	MOVWF	BCD0		;Save low-order digit 
	MOVF	REG1,W		;Get the byte again
	SWAPF	WREG,W
	ANDLW	0x0F		;Mask low-order digit
	MOVWF	BCD1		;Save high-order digit
	MULLW	D'10'
	MOVFF	PRODL,WREG
	ADDWF	BCD0,W
	RETURN
	END
