section .data
	message:	db 'Hello world!'
	messageLen:	equ $-message

section .text
	global _start

_start:
	mov eax,4 ; System call for sys_write
	mov ebx,1 ; File descriptor 1 - STDOUT

	mov ecx,message
	mov edx,messageLen

	int 80h ; Call the kernel

	mov eax,1 ; sys_exit
	mov ebx,0 ; return 0
	int 80h ; Call the kernel
