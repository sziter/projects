.data
.balign 4
myvar1:
	.word 192
.balign 4
myvar2:
	.word 6

.text
.balign 4

.global main
main:
	mov r3, #3
	ldr r1, addr_of_myvar1
	str r3, [r1]
	ldr r2, addr_of_myvar2
	mov r3, #9
	str r3, [r2]

	ldr r1, [r1]
	ldr r2, [r2]
	add r0, r1, r2
	bx lr

addr_of_myvar1 : .word myvar1
addr_of_myvar2 : .word myvar2
