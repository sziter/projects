.text
.global main
main:
	mov r1, #1
	mov r2, #2
	add r0, r1, r2, LSL #2
	bx lr
