	Title "PIC18F452 IP5-6 Data Copy"
	List p=18F452, f =inhx32
	#include <p18F452.inc>		;Header File

BUFFER 	EQU	0x10			;Begin data registers
COUNTER	EQU	0X01			;Counter is REG01

	ORG	0x00			;Reset vector		
	GOTO	START

	ORG	0x20			
START:	MOVLW	0x00			;Init PORTC as an output port
	MOVWF	TRISC			
	MOVLW	0X05			;Init COUNTER=5
	MOVWF	COUNTER			
	LFSR	FSR0,BUFFER		;Init FSR0 pointer
	MOVLW	UPPER SOURCE		;Init Table Pointer
	MOVWF	TBLPTRU			
	MOVLW	HIGH SOURCE
	MOVWF	TBLPTRH
	MOVLW	LOW SOURCE
	MOVWF	TBLPTRL
NEXT:	TBLRD*+				;Copy byte to Table Latch and inc table pointer
	MOVF	TABLAT,W 		;Copy byte to W
	MOVWF	POSTINC0		;Copy byte to data register and inc FSR0
	DECF	COUNTER,F		;Decrement counter
	BNZ	NEXT			;Counter=0?
	MOVLW	0xFF			;Load completion indicator
	MOVWF	PORTC			;Turn on all LEDs at PORTC
	SLEEP

	ORG	0X50			;Data Bytes
SOURCE:	DB	0xF6,0x67,0x7F,0xA9,0x72

	END
