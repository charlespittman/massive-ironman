	list p=18f452, f =inhx32
	#include <p18f452.inc>

reg1:   equ	0x01            ;used by bcdbin
reg2:   equ     0x02            ;used by unpack

bcd1:   equ	0x10            ;first digit
bcd0:   equ	0x11            ;second digit
binary: equ     0x12            ;binary result

        ;; reset vector
	org	0x00
        goto    start

;;;
;;; Function:   Convert a two-digit BCD number in WREG to its binary equivalent
;;; Input:      Two-digit BCD number in WREG
;;; Output:     Binary equivalent in WREG
;;; Alters:     reg1, binary
;;; Calls:      unpack
;;; Notes:      Assumes each digit is in range 0-9
bcdbin:
        ;; Save a copy of the packed BCD
        movwf   reg1

        ;; Unpack the number
        call    unpack

        ;; Fix tens-place
        movf    bcd1, w
	mullw	d'10'
	movff	PRODL, WREG

        ;; Find sum
	addwf	bcd0, w

        ;; Save result to binary
        movwf   binary

        return

;;;
;;; Function:   Splits two-digit packed BCD in WREG into bcd1 and bcd0
;;; Input:      Two-digit packed BCD in WREG
;;; Output:     Two one-digit packed BCD numbers in BCD1, BCD0
;;; Alters:     reg2, bcd1, bcd0
;;; Calls:      none
;;; Notes:      Assumes each digit is in range 0-9
unpack:
        ;; Save a copy of the packed BCD
        movwf   reg2

        ;; Save lower half
	andlw	0x0f
	movwf	bcd0

        ;; Grab another copy of original
	movf	reg2, w

        ;; Save upper half
	swapf	WREG, w
        andlw   0x0f
        movwf   bcd1

        return

;;; Main program
start:
        ;;  Set up and run a few tests
        movlw   0x40
        call    bcdbin
	;; Expect 0010 1000 (0x28)

        movlw   0x02
        call    bcdbin
        ;; Expect 0000 0010 (0x02)

        movlw   0x42
        call    bcdbin
        ;; Expect 0010 1010 (0x2a)

        sleep
        end
