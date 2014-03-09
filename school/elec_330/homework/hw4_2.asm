	Title "hw4.2"
	#include <p18f452.inc>

counter:        equ     0x00    ;number of positive values
buffer:         equ     0x01    ;list of positive values

        ;; Reset vector
	org	0x00
	goto	start

;;; Array for source values.  0x00 represents last item.
        org     0x20
source:
        db      0x66, 0x88, 0x75, 0xf2, 0xca, 0x00

;;; Main program
	org	0x30
start:
        ;; Initialize file pointer to buffer.
	lfsr	FSR0, buffer
        ;; Initialize table pointer for source values.
        movlw	upper source
	movwf	TBLPTRU
	movlw	high source
	movwf	TBLPTRH
	movlw	low source
	movwf	TBLPTRL

;;; Copy next data byte to WREG.  Quit if 0x00.
fetch:
        tblrd*+
        movf    TABLAT, w
        bz      finished            ;0x00 used to indicate final list item

;;; If value is positive, increment counter and copy to buffer.  Fetch next byte.
test:
        bn      fetch
        incf    counter, f
        movwf   POSTINC0
        bra     fetch

finished:
        sleep
        end
