	.arch armv6
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
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	mov	r3, #0
	str	r3, [fp, #-24]	@Guarda espacio las lineas leidas del archivo
	str	r3, [fp, #-28]	@Guarda tamano de la linea
	ldr	r1, .L7		@Carga "r", de solo lectura
	ldr	r0, .L7+4	@Carga "numbers.txt"
	bl	fopen
	str	r0, [fp, #-20]	@Guarda informacion del FILE
	cmp	r0, #0		@Asegura que el FILE no sea nulo
	bne	.L2		@Si no es nulo sigue el programa
	mov	r0, #1
	bl	exit

.L2:
	mov	r3, #0
	str	r3, [fp, #-16]	@Crea una variable para el ciclo
	b	.L3

.L4:
	sub	r1, fp, #28
	sub	r0, fp, #24
	ldr	r2, [fp, #-20]
	bl	getline
	ldr	r0, [fp, #-24]	@Carga la linea leida en el archivo
	bl	atoi		@Cobierte el string a numero
	ldr	r4, [fp, #-16]
	add	r3, r4, #1	@Incrementa el contador
	str	r3, [fp, #-16]
	ldr	r3, .L7+8		@LLama al arreglo de numeros
	str	r0, [r3, r4, lsl #2]	@Guarda el numero leido en el arreglo

.L3:
	ldr	r3, [fp, #-16]
	cmp	r3, #2048
	blt	.L4
	ldr	r0, [fp, #-20]
	bl	fclose
	ldr	r0, [fp, #-24]
	cmp	r0, #0
	beq	.L6		@Termina el metodo
	bl	free		@Libera memoria

.L6:	@Elimina el metodo de memoria
	nop
	sub	sp, fp, #8
	pop	{r4, fp, pc}

.L7:
	.word	.LC0
	.word	.LC1
	.word	numbers
	.size	leerArchivo, .-leerArchivo
	.section	.rodata
	.align	2

.LC2:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	ordenar
	.syntax unified
	.arm
	.fpu vfp
	.type	ordenar, %function

ordenar:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-8]	@Guarda el contador i del primer ciclo
	b	.L10

.L14:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]	@Guarda el contador j del ciclo 2
	b	.L11

.L13:	@Segundo ciclo
	ldr	r1, .L15		@Carga el arreglo
	ldr	r2, [fp, #-8]		@Carga i
	ldr	r3, [fp, #-12]		@Carga j
	ldr	r4, [r1, r2, lsl #2]	@Carga valor en posicion i
	ldr	r5, [r1, r3, lsl #2]	@Carga valor en posicion j
	cmp	r4, r5			@ i > j
	ble	.L12
	str	r5, [r1, r2, lsl #2]	@Guarda lo que en posicion i lo de j
	str	r4, [r1, r3, lsl #2]	@Guarda lo que esta en j en i

.L12:	@Aumenta contador j
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]

.L11:
	ldr	r3, [fp, #-12]
	cmp	r3, #2048
	blt	.L13
	ldr	r2, .L15		@Carga arreglo
	ldr	r3, [fp, #-8]		@Carga i
	add	r4, r3, #1
	str	r4, [fp, #-8]		@i++
	ldr	r1, [r2, r3, lsl #2]	@Carga el numero en i-1
	ldr	r0, .L15+4		@Carga "%d"
	bl	printf

.L10:	@Primer ciclo
	ldr	r3, [fp, #-8]
	cmp	r3, #2048
	blt	.L14
	nop			@Libera el metodo de memoria
	sub	sp, fp, #4
	pop	{fp, pc}

.L15:
	.word	numbers
	.word	.LC2
	.size	ordenar, .-ordenar
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function

main:
	push	{fp, lr}
	add	fp, sp, #4
	bl	leerArchivo
	bl	ordenar
	mov	r0, #0
	pop	{fp, pc}
