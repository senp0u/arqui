	.arch armv6
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	str	fp, [sp, #-4]!
	add	fp, sp, #0

	mov	r3, #0
	mov	r0, r3
	
	add	sp, fp, #
	ldr	fp, [sp], #4
	bx	lr
