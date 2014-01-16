;:::::::::::::::::::::::::::::::::::::::::::::::::::::
;:  AtoD.ASM
;:::::::::::::::::::::::::::::::::::::::::::::::::::::
;  This program configures the A/D Module to convert on
;  A/D channel 0 (the potentiometer) and display the
;  results on the LEDS on PORTB.  
;:::::::::::::::::::::::::::::::::::::::::::::::::::::

  list p=18f4520

  ; Include file
  include "p18f4520.inc"

  ; Start at the reset vector
  ORG   0x000
  GOTO  Start

  ; Start application beyond vector area
  ORG 0x020
Start:
  CLRF  PORTB   ;Clear PORTB
  CLRF  TRISB   ;PORTB all outputs

  MOVLW B'00000001' ;Channel 0, A/D enabled
  MOVWF ADCON0
  MOVLW B'00001110' ;VDD and VSS ref, 1 analog channel
  MOVWF ADCON1    
  MOVLW B'00101101' ;Left justified, Fosc/16, 12 Tad
  MOVWF ADCON2

Main:
  BSF ADCON0,GO ;Start A/D conversion
Wait:
  BTFSC ADCON0,DONE ;Wait for conversion to complete
  BRA Wait

  SWAPF ADRESH,W  ;Swap A/D result nibbles
  ANDLW 0x0F    ;Mask off lower 4 bits
  MOVWF PORTB   ;Write A/D result to PORTB

  BRA Main    ;Do it again

  END
