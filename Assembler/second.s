.text
.global main
main:
	mov r0, #1
	mov r1, #2
	cmp r0, r1
	beq case_eq
case_neq:
	mov r0, #11
	b end

case_eq:
	mov r0, #7
	b end
end:
	bx lr
