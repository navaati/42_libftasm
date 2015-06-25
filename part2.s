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
