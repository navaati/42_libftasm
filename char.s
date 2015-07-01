%include	"macros.nasm"

section	.text

global	_ft_isascii
_ft_isascii:
	mov		rax,~1000_0000b
	or		rax,rdi
	not		rax
	ret

global	_ft_isdigit
_ft_isdigit:
	between	'0','9'
.return:
	ret

global	_ft_islower
_ft_islower:
	between	'a','z'
	ret

global	_ft_isupper
_ft_isupper:
	between	'A','Z'
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
	between	' ','~'
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
