.data
.balign 4
a: .skip 400
b: .skip 8

.text
.global main
main:
	ldr r1, addr_of_a
	mov r2, #0
loop:
	cmp r2, #100
	beq end
if_not_end:
	str r2, [r1, #+4]!
	add r2, r2, #1
	b loop
end:
	ldr r0, [r1, #-12]!
	bx lr

addr_of_a: .word a
