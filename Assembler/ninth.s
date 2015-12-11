.data
.balign 4
mult_by_5:
	/*add r0, r0, r0, LSL #2*/
	sub r1, r0, #1
	MUL r0, r1, r0
	bx lr

.balign 4
message1:
	.asciz "Type in a number: "

.balign 4
message2: .asciz "Your number multiplied by 5 is: %d\n"

.balign 4
scanf_pattern: .asciz "%d"

.balign 4
number_read: .word 0

.balign 4
return:	.word 0

.text
.global main
main:
	ldr r5, address_of_return
	str lr, [r5]

	ldr r0, address_of_message1
	bl printf
break1:
	ldr r0, address_of_scanf_pattern
	ldr r1, address_of_number_read
	bl scanf
break2:
	ldr r0, address_of_number_read
	ldr r0, [r0]
	bl mult_by_5
break3:
	mov r1, r0
	ldr r0, address_of_message2
	bl printf
break4:
	ldr lr, [r5]
	bx lr

address_of_return : .word return
address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_scanf_pattern : .word scanf_pattern
address_of_number_read : .word number_read

.global printf
.global scanf
