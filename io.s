%include	"macros.nasm"

%assign	bufsize	4096

section	.data
	nullmsg	db	`(null)\n`
	.len	equ	$-nullmsg

section	.text

global	_ft_cat
_ft_cat:
	push	rbp					; fd
	mov		rbp,rdi
	sub		rsp,bufsize
.loop:
	mov		rdi,rbp
	mov		rdx,bufsize
	mov		rsi,rsp
	read
	cmp		rax,-1
	je		.return
	cmp		rax,0
	je		.return
	mov		rsi,rsp
	mov		rdx,rax
	write_stdout
	jmp		.loop
.return:
	add		rsp,bufsize
	pop		rbp
	ret

global	_ft_puts
_ft_puts:
	cmp		rdi,0
	jne		.not_null
	lea		rsi,[rel nullmsg]
	mov		rdx,nullmsg.len
	write_stdout
	ret
.not_null:
	push	rbx					; buf
	mov		rbx,rdi
	strlen
	mov		rsi,rbx
	mov		rdx,rax
	write_stdout
	cmp		rax,-1
	je		.return
	lea		rsi,[rel nullmsg+6]
	mov		rdx,1
	write_stdout
.return:
	pop		rbx
	ret
