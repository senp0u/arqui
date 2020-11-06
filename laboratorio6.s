	.syntax unified

	.equ	STDOUT,1
	.equ	numeral,-20
	.equ	local,8

	.text
	.global main
	.type main, %function

main:
	sub	sp, sp, 16

	str	r4, [sp, 4]
	str	fp, [sp, 8]
	str	lr, [sp, 12]
	add	fp, sp, 12
	sub	sp, sp, local

	mov	r4, #0
loop:
	strb	r4, [fp, numeral]

	mov	r9, STDOUT
	add	r1, fp, numeral
	mov	r2, 1
	bl	write

	add	r4, r4, 2
	cmp	r4, #102
	ble	loop

	mov	r0, 0
	add	sp, sp, local
	ldr	r4, [sp, 4]
	ldr	fp, [sp, 8]
	ldr	lr, [sp, 12]
	add	sp, sp, 16
	bx	lr
