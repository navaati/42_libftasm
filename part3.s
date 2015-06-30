	extern	write_stdout

	section	.text

read:
	mov		rax,0x2000003
	syscall
	jnc		.return
	mov		rax,-1
.return:
	ret

	global	_ft_cat
_ft_cat:
	push	rbp					; fd
	mov		rbp,rdi
	sub		rsp,4096
.loop:
	mov		rdi,rbp
	mov		rdx,4096
	mov		rsi,rsp
	call	read
	cmp		rax,-1
	je		.return
	cmp		rax,0
	je		.return
	mov		rsi,rsp
	mov		rdx,rax
	call	write_stdout
	jmp		.loop
.return:
	add		rsp,4096
	pop		rbp
	ret
