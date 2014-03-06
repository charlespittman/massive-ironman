	Title "EX11-2 One Second Delay With Interrupt"
 	List p=18F452, f =inhx32
	#include <p18F452.inc>		;This is a header file

COUNTER		EQU	0x00
SCALE		EQU	0x40

		ORG	00
		GOTO	MAIN

		ORG	0x08
		GOTO	TMR0_ISR

MAIN:		MOVLW	B'11100000'	;Timer0:interrupt enable
		MOVWF	INTCON	
		MOVLW	B'01000100'	;Timer0:8-bit,internal clock,prescale-1:32
		MOVWF	T0CON				
		CLRF	TRISC		;Enable PORTC as output
		CLRF	COUNTER		;Clear Counter
START:		MOVLW	SCALE		;Low count
		MOVWF	TMR0L		;Load low count in Timer0
		BCF 	INTCON,TMR0IF	;Clear TIMR0 overflow flag – Reset timer
		BSF	T0CON,TMR0ON	;Enable Timer0
HERE:		GOTO	HERE		;Wait here for an interrupt

		ORG	0x100
TMR0_ISR:	MOVLW	SCALE		;Low count
		MOVWF	TMR0L		;Load low count in Timer0
		BCF 	INTCON,TMR0IF	;Clear TIMR0 overflow flag – Reset timer
		INCF	COUNTER,F	;Increment Counter
		MOVFF	COUNTER,PORTC	;Display Counter
		RETFIE FAST		;Return
		END
