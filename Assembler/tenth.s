.data
.balign 4
message1: .asciz "Compute factorial of: "

.balign 4
message2: .asciz "Factorial of %d = %d\n"

.balign 4
number_to_read: .word 0

.balign 4
scanf_pattern: .asciz "%d"

.balign 4
return: .word 0

.text
factorial:
	push {r0, lr}
	cmp r0, #0
	beq endend
not_eq:
	sub r0, r0, #1
	bl factorial
	pop {r0, lr}
	mul r0, r1, r0
	bx lr

endend:
	pop {r0, lr}
	mov r0, #1
	bx lr

.global main
main:
	ldr r1, addr_return
	str lr, [r1]

	ldr r0, addr_message1
	bl printf
break1:
	ldr r0, addr_scanf_pattern
	ldr r1, addr_number_to_read
	bl scanf
break2:
	ldr r0, addr_number_to_read
	ldr r0, [r0]
	bl factorial
break3:
	mov r2, r0
	ldr r0, addr_message2
	ldr r1, addr_number_to_read
	ldr r1, [r1]
	bl printf
break4:
	ldr r1, addr_return
	ldr lr, [r1]
	bx lr

addr_return : .word return
addr_message1 : .word message1
addr_message2 : .word message2
addr_scanf_pattern : .word scanf_pattern
addr_number_to_read : .word number_to_read

.global printf
.global scanf
