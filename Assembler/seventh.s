.data
.balign 4
	message1: .asciz "Type a number: "

.balign 4
	message2: .asciz "I read the number %d\n"

.balign 4
	scanf_pattern: .asciz "%d"

.balign 4
	number_read: .word 0

.text
.global main
main:
	mov r5, lr

	ldr r0, address_of_message1
	bl printf

	ldr r0, address_of_scanf_pattern
	ldr r1, address_of_number_read
	bl scanf

	ldr r0, address_of_message2
	ldr r1, address_of_number_read
	ldr r1, [r1]
	bl printf

	ldr r0, address_of_number_read
	ldr r0, [r0]

	mov lr, r5
	bx lr

address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_scanf_pattern : .word scanf_pattern
address_of_number_read : .word number_read

.global printf
.global scanf
