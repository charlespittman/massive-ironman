	Title "IP6-4: Finding Max Temperature"
	List p=18F452, f =inhx32
	#include <p18F452.inc>		;The header file

REG0	EQU 	0x00			;Define Data Registers		
BUFFER 	EQU	0x10			

	ORG	0x00			;Reset Vector
	GOTO	START

	ORG	0x20			
START:	CLRF	REG0			;Init REG0
	LFSR	FSR0,BUFFER		;Init Pointer
NEXT:	MOVF	POSTINC0,W 		;Copy data byte to WREG
	BZ	FINISH			;Data = 0?
	BTFSC	WREG,7			;Data > 0?
	BRA	NEXT			
	CPFSLT	REG0			;REG0 < Data?
	BRA	NEXT			
	MOVWF	REG0			;Save Larger Data
	BRA	NEXT			;Go back and check next byte
FINISH	SLEEP
	END
