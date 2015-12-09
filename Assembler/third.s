.text
.global main
main:
	mov r0, #3
	mov r1, #27
if_eval:
	cmp r0, r1
	beq end
do_while_neq:
	add r0, #1
	b if_eval
end:
	bx lr
