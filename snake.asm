section .data
	sideLen: equ 39
	sideChar: equ '#'
	side: times sideLen db sideChar, 0
	sideSize: equ $-side
	newline: db 10, 13, 0
	newlineSize: equ $-newline
		

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
	call print_row

	mov eax, syscall_exit
	mov ebx, 0
	int 80h

write:
	push eax
	push ebx
	mov eax, syscall_write
	mov ebx, stdout
	int 80h
	pop ebx
	pop eax
	ret

print_row:
	push sideChar
	mov ecx, esp
	mov edx, 1
	call write
	add esp, 4

.print_row_loop:
	push sideChar
	mov eax, sideLen-2
	mov ecx, esp
	mov edx, 1
	call write
	add esp, 4
	sub eax, 1
	cmp eax, 0
	jne .print_row_loop

	ret
