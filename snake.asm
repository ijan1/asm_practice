section .data
	sideLen: equ 40
	grid: times sideLen*2 db 0, 0
	gridSize: equ $-grid
	char: equ '#'

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
	call initGrid
	; exit with code 0
	mov eax, syscall_write
	mov ebx, stdout

	mov ecx, grid
	mov edx, sideLen*sideLen
	int 80h


	mov eax, syscall_exit
	mov ebx, 0
	int 80h

initGrid:
	push char
	mov eax, esp

	mov ebx, grid

	mov ecx, 0
	_grid_loop:
	mov [ebx + ecx], byte 35
	inc ecx
	cmp ecx, sideLen*sideLen
	jne _grid_loop
	add esp, 4
	ret
