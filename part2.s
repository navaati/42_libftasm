	extern	_malloc

	section	.text

	global	_ft_strlen
_ft_strlen:
	mov		rax,0
	mov		rcx,-1
	cld
	repnz scasb
	mov		rax,-2
	sub		rax,rcx
	ret

	global	_ft_memset
_ft_memset:
	mov		rcx,rdx
	mov		rdx,rdi
	mov		rax,rsi
	cld
	rep stosb
	mov		rax,rdx
	ret

	global	_ft_memcpy
_ft_memcpy:
	mov		rcx,rdx
	mov		rdx,rdi
	cld
	rep movsb
	mov		rax,rdx
	ret

	global	_ft_strdup
_ft_strdup:
	push	rbx 				; orig address
	push	rbp					; string size
	mov		rbx,rdi
	call	_ft_strlen
	mov		rdi,rax
	mov		rbp,rax
	call	_malloc
	cmp		rax,0
	je		.return
	mov		rdi,rax
	mov		rsi,rbx
	mov		rdx,rbp
	call	_ft_memcpy
.return:
	pop		rbp
	pop		rbx
	ret
