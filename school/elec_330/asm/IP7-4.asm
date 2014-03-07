;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
; This program copies unsigned data bytes from program memory into data registers
; and adds the bytes.  The 16-bit sum is displayed at PORTB and PORTC.  The program 
; includes two subroutines which are provided parameters by the main: the number of 
; bytes and their memory locations
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	Title "IP7-4 Copying and Adding Bytes"
	List p=18F452, f =inhx32
	#include <p18F452.inc>	;The header file  

BUFFER 	EQU	0x10		;Beginning data register address
COUNTER	EQU	0X01		;Counter for number of bytes

		ORG	00
		GOTO 	MAIN

		ORG	0x20
MAIN:	MOVLW	0x00		;Initialize Ports B & C as an output ports
	MOVWF	TRISB			
	MOVWF	TRISC	
	LFSR	FSR0,BUFFER	;Set up FSR0 as pointer for data registers
	MOVLW	05		;Init COUNTER
	MOVWF	COUNTER
	CALL	DATACOPY	;Call DATACOPY Subroutine
	LFSR	FSR0,BUFFER	;Set up FSR0 as pointer for data registers
	MOVLW	05		;Init COUNTER
	MOVWF	COUNTER
	CALL	ADDITION	;Call ADDITION Subroutine
	MOVWF	PORTC		;Display low-order byte of sum at PORTC
	MOVFF	CYREG,PORTB	;Display high-order byte of sum at PORTB
	SLEEP

DATACOPY: ;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	  ; Function: This subroutine copies data bytes from program memory at
          ;           SOURCE to data registers at BUFFER.
	  ; Input:    Pointer to BUFFER in FSR0 and the number of bytes to
	  ;           be copied in COUNTER.
	  ;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	
	MOVLW	UPPER SOURCE	;Set up TBLPTR pointing to Source
	MOVWF	TBLPTRU	
	MOVLW	HIGH SOURCE 
	MOVWF	TBLPTRH 
	MOVLW	LOW SOURCE 
	MOVWF	TBLPTRL
NEXT:	TBLRD*+			;Copy byte to Table Latch and increment source pointer
	MOVF	TABLAT,W 	;Copy byte from Table Latch to W
	MOVWF	POSTINC0	;Copy byte from W to BUFFER and increment FSR0 
	DECF	COUNTER,F	;Decrement counter
	BNZ	NEXT		;Is copying complete?  If not go back to copy next byte
	RETURN
		
CYREG	EQU 	0x02	

ADDITION: ;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	  ; Function: This subroutine adds data bytes stored in data registers BUFFER.
	  ; Input:    Pointer to BUFFER in FSR0 and the number of bytes to be 
	  ;           copied in COUNTER.
	  ; Output:   The 16-bit sum in CYREG and WREG.
	  ;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

	CLRF 	CYREG		;Clear carry register and W for sum
	MOVLW	0x00		
NXTADD:	ADDWF	POSTINC0,W 	;Add byte and increment FSR0
	BNC	SKIP		;Check for carry: if no carry jump to SKIP	
	INCF	CYREG,F		;If there is carry, increment CYREG 
SKIP:	DECF	COUNTER,F	;Decrement counter
	BNZ	NXTADD		;Is addition complete?  If not go back to add next byte
	RETURN

SOURCE:	DB	0xF6,0x67,0x7F,0xA9,0x72

	END
