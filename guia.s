	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"guia.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"r\000"
	.align	2
.LC1:
	.ascii	"numbers.txt\000"
	.align	2
.LC2:
	.ascii	"%i\000"
	.text
	.align	2
	.global	leerArchivo
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	leerArchivo, %function
leerArchivo:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r1, .L6
	ldr	r0, .L6+4
	bl	fopen
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L3
	mov	r0, #1
	bl	exit
.L4:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	atoi
	str	r0, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, .L6+8
	bl	printf
.L3:
	sub	r1, fp, #20
	sub	r3, fp, #16
	ldr	r2, [fp, #-8]
	mov	r0, r3
	bl	getline
	mov	r3, r0
	cmn	r3, #1
	bne	.L4
	ldr	r0, [fp, #-8]
	bl	fclose
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L5
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	free
.L5:
	mov	r0, #0
	bl	exit
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	leerArchivo, .-leerArchivo
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	leerArchivo
	mov	r3, #0
	mov	r0, r3
	pop	{fp, pc}
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
