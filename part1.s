	section	.text

	global	_ft_bzero
_ft_bzero:
	cmp		rsi,0
	jmp		.cond
.loop:
	mov		byte[rdi],0
	inc		rdi
	dec		rsi
.cond:
	jnz		.loop
	ret

	global	_ft_isascii
_ft_isascii:
	mov		rax,~1000_0000b
	or		rax,rdi
	not		rax
	ret
