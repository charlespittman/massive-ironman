        Title "hw4.2"
        List p=18F452, f=inhx32
        #include <p18f452.inc>

counter:        equ     0x00    ;number of positive values
buffer:         equ     0x01    ;list of positive values

        ;; Reset vector
        org     0x00
        goto    start

;;; Array for source values.  0x00 represents last item.
        org     0x20
source:
        db      0x66, 0x88, 0x75, 0xf2, 0xca, 0x00

;;; Main program
        org     0x30
start:
        ;; Initialize file pointer to buffer.
        lfsr    FSR0, buffer
        ;; Initialize table pointer for source values.
        movlw   upper source
        movwf   TBLPTRU
        movlw   high source
        movwf   TBLPTRH
        movlw   low source
        movwf   TBLPTRL

;;; Copy next data byte to WREG.  Stop when the next byte is 0x00.
fetch:
        tblrd*+
        movf    TABLAT, w
        bz      to_table        ;0x00 used to indicate final list item

;;; If value is positive, increment counter and copy to buffer.  Fetch next byte.
test:
        bn      fetch
        incf    counter, f
        movwf   POSTINC0
        bra     fetch

;;; Copy buffer to a new table.
to_table:
        ;; Set file pointer back to beginning of buffer.
        lfsr    FSR0, buffer
        ;; Set table pointer to 0x018040
        movlw   0x01
        movwf   TBLPTRU
        movlw   0x80
        movwf   TBLPTRH
        movlw   0x40
        movwf   TBLPTRL
copy:
        ;; Copy buffer -> table latch -> table.  Stop on 0x00.
        movf    POSTINC0, W
        movwf   TABLAT
        tblwt*+
        bnz     copy

finished:
        sleep
        end
