.data
.balign 4
message1: .asciz "j = %d\n"
.text
.global main
main:
	push {r5, lr}
	mov r3, #0
	mov r5, #0x0000F000
outer_loop:
	mov r1, #0
	mov r2, #4096
loop:
	add r1, r1, #1
	add r1, r1, #1
	add r1, r1, #1
	add r1, r1, #1
	subs r2, r2, #4
	bne loop
	add r3, r3, #1
	cmp r3, r5
	bne outer_loop

	ldr r0, addr_message1
	mov r1, r3
	bl printf
	pop {r5, lr}
	mov r0, #1
	bx lr

addr_message1 : .word message1

.global printf
