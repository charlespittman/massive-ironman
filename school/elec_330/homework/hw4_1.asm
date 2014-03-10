        Title "hw4.1"
        List p=18F452, f=inhx32
        #include <p18f452.inc>

counter:        equ     0x00
buffer:         equ     0x20    ;results

        ;; Reset vector
        org     0x00
        org     0x00
        goto    start

;;; Array for source values.
        org     0x20
source:
        db      0xe3, 0x72, 0x5d, 0x81, 0xcc, 0x34

;;; Main program
        org     0x30
start:
        ;; Set PORTC as output port.
        movlw   0x00
        movwf   TRISC
        ;; Set counter value.
        movlw   0x06
        movwf   counter
        ;; Set file pointer to buffer.
        lfsr    FSR0, buffer
        ;; Set table pointer for source values
        movlw   upper source
        movwf   TBLPTRU
        movlw   high source
        movwf   TBLPTRH
        movlw   low source
        movwf   TBLPTRL

;;; Copy next data byte to WREG.  Quit if counter lteq 0.
next:
        tblrd*+
        decf    counter, f
        bn      finished        ;counter goes negative if last item of source isn't copied to buffer
        movf    TABLAT, w

;;; If value is negative, copy to buffer.  Fetch next byte unless counter eq 0.
        bnn     next
        movwf   POSTINC0
        bnz     next

;;; Turn on the completion indicator before sleeping.
finished:
        movlw   0xff
        movwf   PORTC
        sleep
        end
