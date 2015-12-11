.data
.balign 4
message1: .asciz "i = %d\n"
.text
.global main
main:
	push {lr}

	vmov.f32 q0, #8.0
	vadd.f32 q0, q0, q0
	vpush {q0}

	ldr r0, addr_message1
	ldr r1, [sp, +#4]
	bl printf

	vpop {q0}
	pop {lr}
	bx lr

addr_message1 : .word message1

.global printf
