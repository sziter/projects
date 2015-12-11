.data
.balign 4
message1: .asciz "Hallo !!\n"

.balign 4
var1: .word 0

.text
.global main
main:
	push {r7, lr}

	ldr r3, addr_var1
	mov r2, #13
	str r2, [r3]

	mov r7, #4
	mov r0, #1
	ldr r1, addr_message1
	mov r2, #9
	swi #0

	mov r0, #0
	pop {r7, lr}
	bx lr

addr_message1 : .word message1
addr_var1 : .word var1
