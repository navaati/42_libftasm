	extern	_ft_strlen

	section	.data
nullmsg	db	`(null)\n`
.len	equ	$-nullmsg

	section	.text

	global	_ft_bzero
_ft_bzero:
	mov		rcx,rsi
	jecxz	.return
.loop:
	mov		byte[rdi],0
	inc		rdi
	loop	.loop
.return:
	ret

	global	_ft_isascii
_ft_isascii:
	mov		rax,~1000_0000b
	or		rax,rdi
	not		rax
	ret

	global	_ft_isdigit
_ft_isdigit:
	mov		rax,0
	cmp		rdi,'0'
	jl		.return
	cmp		rdi,'9'
	jg		.return
	mov		rax,1
.return:
	ret

	global	_ft_islower
_ft_islower:
	mov		rax,0
	cmp		rdi,'a'
	jl		.return
	cmp		rdi,'z'
	jg		.return
	mov		rax,1
.return:
	ret

	global	_ft_isupper
_ft_isupper:
	mov		rax,0
	cmp		rdi,'A'
	jl		.return
	cmp		rdi,'Z'
	jg		.return
	mov		rax,1
.return:
	ret

	global	_ft_isalpha
_ft_isalpha:
	push	rbx
	call	_ft_isupper
	mov		rbx,rax
	call	_ft_islower
	or		rax,rbx
	pop		rbx
	ret

	global	_ft_isalnum
_ft_isalnum:
	push	rbx
	call	_ft_isalpha
	mov		rbx,rax
	call	_ft_isdigit
	or		rax,rbx
	pop		rbx
	ret

	global	_ft_isprint
_ft_isprint:
	mov		rax,0
	cmp		rdi,' '
	jl		.return
	cmp		rdi,'~'
	jg		.return
	mov		rax,1
.return:
	ret

	global	_ft_tolower
_ft_tolower:
	push	rdi
	call	_ft_isupper
	cmp		rax,0
	pop		rax
	je		.return
	add		rax,'a'-'A'
.return:
	ret

	global	_ft_toupper
_ft_toupper:
	push	rdi
	call	_ft_islower
	cmp		rax,0
	pop		rax
	je		.return
	sub		rax,'a'-'A'
.return:
	ret

write_stdout:
	mov		rax,0x2000004
	mov		rdi,1
	syscall
	jnc		.return
	mov		rax,-1
.return:
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
