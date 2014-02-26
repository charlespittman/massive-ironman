        #include <p18f4520.inc>
byte:   equ 0xc7
result: equ 0x01

        org 0x00
        goto start

        org 0x20
start:
        movlw byte
        movwf result
        bn next
        bcf result, 7

next:   sleep
        end
