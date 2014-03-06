	#include <p18f4520.inc>
sum:    equ 0x10

	org 0x00
	goto start

	org 0x20
start:
	movlw d'93'
	movwf sum
	movlw d'122'
	addwf sum,w
	bnc save
	setf WREG

save:
	movwf sum
	sleep
	end
