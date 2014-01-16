;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;This program is written as a subroutine.  It checks a key closure 	:
;and encodes the key in binary digit that represents key's position	:
;                                                                       :
;This is a rewrite of IP9-7 in the text to interface with the matrix    :
;keypad in the PIC18 Simulator IDE					:					:
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	Title "Illust9-7 Matrix Keypad"
	List p=18F452, f =inhx32
	#include <p18F452.inc>	     		;This is a header file

KYSOPEN		EQU		0x00		;Define data registers used
COUNTER		EQU		0x01

		ORG		0x00
		GOTO		KEYPAD

		ORG		0x20
KEYPAD:		MOVLW		0xF0		;Enable RB7-RB4 as input and RB3-RB0 as output
		MOVWF		TRISB
		MOVLW		0x0F		;Reading when all keys are open
		MOVWF		KYSOPEN		;		
		CLRF		TRISC		;Enable PORTC as output
MAIN:		CALL		KEYCHK		;Call key check subroutine
		MOVWF		PORTC		;Output code to PORTC
		BRA		MAIN


            	;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      	      	;Function: KEYCHK checks first that all keys are open, then     :
	    	;checks a key closure using KEYCODE                             :
		;Output: Sets Bit7 if all keys are open                         :
		;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

KEYCHK:		MOVLW	0x0F		;Set RB0-RB3 Hi
		MOVWF	PORTB
		MOVF	PORTB,W		;Read PORTB
		CPFSEQ 	KYSOPEN		;Are all keys open?
		BRA	KEYCODE
		MOVLW	B'10000000'	;Return a 1 in Bit7 if all open
		RETURN			

		;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		;Function: KEYCODE encodes the key and identify the key position:                    :
		;Output: Encoded key position in W register                     :
		;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

KEYCODE:
COLRB0:		MOVLW	0x00		;Get ready to scan Column RB0
		ANDWF	PORTB, F	;All other keys should be 0s
SETRB0:		BSF	PORTB, 0	;Set Column - RB0
KEYB04:		BTFSS 	PORTB, 4	;Check RB4, if = 1, find code
		BRA	KEYB05 		;If RB4 = 0, check next key
		MOVLW	0x01		;Code for Key '1'
		RETURN
KEYB05:		BTFSS	PORTB, 5 	;Check RB5, if = 1, find code
		BRA	KEYB06		;If RB5 = 0, check next key
		MOVLW	0x04		;Code for key '4'
		RETURN
KEYB06:		BTFSS	PORTB, 6 	;Check RB6, if = 1, find code
		BRA	KEYB07		;If RB6 = 0, check next key
		MOVLW	0x07		;Code for key '7'
		RETURN
KEYB07:		BTFSS	PORTB, 7 	;Check RB7, if = 1, find code
		BRA	COLRB1		;If RB7 = 0, go to next column
		MOVLW	0x0A		;Code for key 'A'
		RETURN
COLRB1:		MOVLW	0x00		;Get ready to scan Column RB1
		ANDWF	PORTB, F	;All other keys should be 0s
SETRB1:		BSF	PORTB, 1	;Set Column - RB1
KEYB14:		BTFSS 	PORTB, 4	;Check RB4, if = 1, find code
		BRA	KEYB15 		;If RB4 = 0, check next key
		MOVLW	0x02		;Code for Key '2'
		RETURN
KEYB15:		BTFSS	PORTB, 5 	;Check RB5, if = 1, find code
		BRA	KEYB16		;If RB5 = 0, check next key
		MOVLW	0x05		;Code for key '5'
		RETURN
KEYB16:		BTFSS	PORTB, 6 	;Check RB6, if = 1, find code
		BRA	KEYB17		;If RB6 = 0, check next key
		MOVLW	0x08		;Code for key '8'
		RETURN
KEYB17:		BTFSS	PORTB, 7 	;Check RB7, if = 1, find code
		BRA	COLRB2		;If RB7 = 0, go to next column
		MOVLW	0x00		;Code for key '0'
		RETURN
COLRB2:		MOVLW	0x00		;Get ready to scan Column RB2
		ANDWF	PORTB, F	;All other keys should be 0s
SETRB2:		BSF	PORTB, 2	;Set Column - RB2
KEYB24:		BTFSS 	PORTB, 4	;Check RB4, if = 1, find code
		BRA	KEYB25 		;If RB4 = 0, check next key
		MOVLW	0x03		;Code for Key '3'
		RETURN
KEYB25:		BTFSS	PORTB, 5 	;Check RB5, if = 1, find code
		BRA	KEYB26		;If RB1 = 5, check next key
		MOVLW	0x06		;Code for key '6'
		RETURN
KEYB26:		BTFSS	PORTB, 6 	;Check RB6, if = 1, find code
		BRA	KEYB27		;If RB6 = 0, check next key
		MOVLW	0x09		;Code for key '9'
		RETURN
KEYB27:		BTFSS	PORTB, 7 	;Check RB7, if = 1, find code
		BRA	COLRB3		;If RB7 = 0, go to next column
		MOVLW	0x0B		;Code for key 'B'
		RETURN
COLRB3:		MOVLW	0x00		;Get ready to scan Column RB3
		ANDWF	PORTB, F	;All other keys should be 0s
SETRB3:		BSF	PORTB, 3	;Set Column - RB3
KEYB34:		BTFSS 	PORTB, 4	;Check RB4, if = 1, find code
		BRA	KEYB35 		;If RB4 = 0, check next key
		MOVLW	0x0C		;Code for Key 'C'
		RETURN
KEYB35:		BTFSS	PORTB, 5 	;Check RB5, if = 1, find code
		BRA	KEYB36		;If RB5 = 0, check next key
		MOVLW	0x0D		;Code for key 'D'
		RETURN
KEYB36:		BTFSS	PORTB, 6 	;Check RB6, if = 1, find code
		BRA	KEYB37		;If RB6 = 0, check next key
		MOVLW	0x0E		;Code for key 'E'
		RETURN
KEYB37:		BTFSS	PORTB, 7 	;Check RB7, if = 1, find code
		BRA	RTN		;If RB7 = 0, go to next column
		MOVLW	0x0F		;Code for key 'F'
RTN:		RETURN

		END


