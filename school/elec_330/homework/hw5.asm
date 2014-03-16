	list p=18f452, f =inhx32
	#include <p18f452.inc>


reg1:   equ	0x01            ;used by bcdbin
reg2:   equ     0x02            ;used by unpack

bcd0:   equ	0x10
bcd1:   equ	0x11
binary: equ     0x12

        ;; reset vector
	org	0x00
        goto    start

;;; Main program
	org     0x20
start:
        goto    bcdbin
        end

;;;
;;; Function:   Convert a two-digit BCD number in WREG to its binary equivalent
;;; Input:      Two-digit BCD number in WREG
;;; Output:     Binary equivalent in WREG
;;; Alters:     reg1, binary
;;; Calls:      unpack
;;; Notes:      Assumes each digit is in range 0x00-0x0A
bcdbin:
        ;; Save a copy of the packed BCD
        movwf   reg1

        ;; Unpack the number
        call    unpack

        ;; Fix tens-place
        movf    bcd1, w
	mullw	d'10'
	movff	prodl, WREG

        ;; Find sum
	addwf	bcd0, w

        ;; Save result to binary
        movwf   binary

;;;
;;; Function:   Splits two-digit packed BCD in WREG into bcd1 and bcd0
;;; Input:      Two-digit packed BCD in WREG
;;; Output:     Two one-digit packed BCD numbers in BCD1, BCD0
;;; Alters:     reg2, bcd1, bcd0
;;; Calls:      none
;;; Notes:      Assumes each digit is in range 0x00-0x0A
unpack:
        ;; Save a copy of the packed BCD
        movwf   reg2

        ;; Save lower half
	andlw	0x0f
	movwf	bcd0

        ;; Grab another copy of original
	movf	reg2, w		;get the byte again

        ;; Save upper half
	swapf	WREG, w
        andlw   0x0f
        movwf   bcd1

        return

;;;
;;; First half of the homework. Might be useful for generating tests.
;;;
;; counter:        equ     0x00
;; ledcode:        equ     0x12
;; start:  call    unpack
;;         call    outled
;;         movlw   d'5'

;; unpack: movf    counter,W
;;         andlw   0x0f

;;         swapf   bcd1, F
;;         return

;; outled: movf    bcd0, W
;;         call    getcode

;;         movff   TABLAT, PORTC

;; getcode:        movwf temp
;;         movlw   upper ledcode

;;         end
