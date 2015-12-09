.data

greeting:
	.asciz "Hello World"
	.balign 4

.text
.global main
main:
	mov r5, lr

	ldr r0, address_of_greeting

	bl puts

	mov lr, r5
	bx lr

address_of_greeting: .word greeting

.global puts
