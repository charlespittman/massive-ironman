;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;PWM example: Period 10kHz, 40% Duty Cycle
;MCU clock frequency = 10 MHz                                  :
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	Title "Ex11-9"
 	List p=18F452, f =inhx32
	#include <p18F452.inc>			;This is a header file

		ORG	0x00
		GOTO	MAIN

		ORG	0x20
MAIN:		BCF	TRISC,2		;RC2/CCP1 PORTC output
		MOVLW	D'250'		;Count for 10kHz in PR2
		MOVWF	PR2
		MOVLW	D'100'		;Duty cycle in CCPR1
		MOVWF	CCPR1L
		CLRF	TMR2
		MOVLW	B'00000100'	;Turn on Timer2 (prescaler 1)
		MOVWF	T2CON
		MOVLW	B'00001100'	;Set CCP1 for PWM
		MOVWF	CCP1CON
HERE:		GOTO	HERE

