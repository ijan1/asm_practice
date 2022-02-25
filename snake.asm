section .data
	side: times 39 db '#', 0
	sideSize: equ $-side
	newline: db 10, 13, 0
	newlineSize: equ $-newline
	string: db "Hello, world!", 0
	stringSize: equ $-string

	stdin:  equ 0
	stdout: equ 1
	stderr: equ 2
	true:   equ 1
	false:  equ 0
	STDIN:  equ stdin
	STDOUT: equ stdout
	STDERR: equ stderr
	
	syscall_read: equ 3
	syscall_write: equ 4
	syscall_exit: equ 1

section .text
	global _start

_start:
	mov ecx, side	
	mov edx, sideSize
	call write

	mov ecx, newline
	mov edx, newlineSize
	call write

	mov ecx, string
	mov edx, stringSize
	call write

	mov eax, syscall_exit
	mov ebx, 0
	int 80h

write:
	mov eax, syscall_write
	mov ebx, stdout
	int 80h
	ret
