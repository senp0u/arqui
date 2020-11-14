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
	.comm	numbers,8192,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"r\000"
	.align	2
.LC1:
	.ascii	"numbers.txt\000"
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
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r1, .L7
	ldr	r0, .L7+4
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L2
	mov	r0, #1
	bl	exit
.L2:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L3
.L4:
	sub	r1, fp, #28
	sub	r3, fp, #24
	ldr	r2, [fp, #-20]
	mov	r0, r3
	bl	getline
	ldr	r2, [fp, #-24]
	ldr	r4, [fp, #-16]
	add	r3, r4, #1
	str	r3, [fp, #-16]
	mov	r0, r2
	bl	atoi
	mov	r2, r0
	ldr	r3, .L7+8
	str	r2, [r3, r4, lsl #2]
.L3:
	ldr	r3, [fp, #-16]
	cmp	r3, #2048
	blt	.L4
	ldr	r0, [fp, #-20]
	bl	fclose
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	free
.L6:
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.word	numbers
	.size	leerArchivo, .-leerArchivo
	.align	2
	.global	ordenar
	.syntax unified
	.arm
	.fpu vfp
	.type	ordenar, %function
ordenar:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L14:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L11
.L13:
	ldr	r2, .L15
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L15
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	ble	.L12
	ldr	r2, .L15
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-16]
	ldr	r2, .L15
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L15
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, lsl #2]
	ldr	r1, .L15
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r1, r3, lsl #2]
.L12:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L11:
	ldr	r3, [fp, #-12]
	cmp	r3, #2048
	blt	.L13
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	ldr	r2, .L15+4
	cmp	r3, r2
	ble	.L14
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	numbers
	.word	2046
	.size	ordenar, .-ordenar
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
	bl	ordenar
	mov	r0, #0
	bl	exit
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
