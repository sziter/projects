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
	.file	"func.c"
	.text
	.align	2
	.global	func
	.type	func, %function
.align 4
func:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push {r4, r5}
	mov r3, #0
outer_loop:
	mov r2, #0
	mov r5, r1
loop:
	add r2, r2, #1
	add r2, r2, #1
	add r2, r2, #1
	add r2, r2, #1
	subs r5, r5, #4
	bne loop

	add r3, r3, #1
	cmp r3, r0
	bne outer_loop

	mov r0, r3
	pop {r4, r5}
	bx	lr
	.size	func, .-func
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
