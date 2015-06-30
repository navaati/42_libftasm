extern	_ft_strlen

section	.data
	nullmsg	db	`(null)\n`
	.len	equ	$-nullmsg

section	.text

write_stdout:
	mov		rax,0x2000004
	mov		rdi,1
	syscall
	jnc		.return
	mov		rax,-1
.return:
	ret

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

global	_ft_puts
_ft_puts:
	cmp		rdi,0
	jne		.not_null
	lea		rsi,[rel nullmsg]
	mov		rdx,nullmsg.len
	call	write_stdout
	ret
.not_null:
	push	rbx					; buf
	mov		rbx,rdi
	call	_ft_strlen
	mov		rsi,rbx
	mov		rdx,rax
	call	write_stdout
	cmp		rax,-1
	je		.return
	lea		rsi,[rel nullmsg+6]
	mov		rdx,1
	call	write_stdout
.return:
	pop		rbx
	ret
