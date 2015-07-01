%macro	between	2
	mov		rax,0
	cmp		rdi,%1
	jl		%%return
	cmp		rdi,%2
	jg		%%return
	mov		rax,1
%%return:
%endmacro

%macro	strlen	0
	mov		rax,0
	mov		rcx,-1
	cld
	repnz scasb
	mov		rax,-2
	sub		rax,rcx
%endmacro

%macro	callsys	1
	mov		rax,%1
	syscall
	jnc		%%return
	mov		rax,-1
%%return:
%endmacro

%macro	write_stdout 0
	mov		rdi,1
	callsys	0x2000004
%endmacro

%define	read	callsys	0x2000003
