%include	"macros.nasm"

extern	_malloc

section	.text

global	_ft_bzero
_ft_bzero:
	mov		rcx,rsi
	jrcxz	.return
.loop:
	mov		byte[rdi],0
	inc		rdi
	loop	.loop
.return:
	ret

global	_ft_strcat
_ft_strcat:
	push	rbx					; s1
	mov		rbx,rdi
	mov		rax,0
	mov		rcx,-1
	repnz scasb
	dec		rdi
.loop:
	movsb
	cmp		byte[rsi - 1],0
	jne		.loop
	mov		rax,rbx
	pop		rbx
	ret

global	_ft_strlen
_ft_strlen:
	strlen
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
	strlen
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
