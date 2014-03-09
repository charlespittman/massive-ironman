	Title "hw4.2"
	#include <p18f452.inc>

counter:        equ     0x00
buffer:         equ     0x01

	org	0x00			;reset vector
	goto	start

        org     0x20
source:
        db      0x66, 0x88, 0x75, 0xf2, 0xca, 0x00

	org	0x30
start:
	lfsr	FSR0,buffer		;init pointer
        movlw	upper source		;init table pointer
	movwf	TBLPTRU
	movlw	high source
	movwf	TBLPTRH
	movlw	low source
	movwf	TBLPTRL

fetch:
        ;; Copy next data byte to WREG
        tblrd*+
        movf    TABLAT,w
        bz      finished            ;0x00 used to indicate final list item

test:
        ;; If value is positive, increment counter and copy to buffer.
        ;; Get next byte
        bn      fetch
        incf    counter, f
        movwf    POSTINC0
        bra     fetch

finished:
        sleep

        end
