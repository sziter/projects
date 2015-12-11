	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"m = %d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov r1, #0
	b	.L2
.L5:
	mov	r3, #0
	mov r4, #4096
.L4:
	add r3, r3, #1
	subs r4, r4, #1
	bne	.L4
	add	r1, r1, #1
.L2:
	cmp	r1, #61440
	bne	.L5
	ldr	r0, .L7
	bl	printf
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {r4, fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
