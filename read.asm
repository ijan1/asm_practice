section .data
	buffer: times 128 db 0
	bufferSize: equ $-buffer

	string:	db ':3 nyan!', 0
	stringLen: equ $-string

	stdin:	equ 0
	stdout:	equ 1
	stderr: equ 2
	true:	equ 1
	false:	equ 0
	STDIN:	equ stdin
	STDOUT: equ stdout
	STDERR: equ stderr

	syscall_read: equ 3
	syscall_write: equ 4
	syscall_exit: equ 1

section .text
	global _start

_start:
	; Read data from stdin
	mov ecx,buffer
	mov edx,bufferSize
	call read

	; write the buffer to STDOUT
	call write

	; write the string to STDOUT
	mov ecx,string
	mov edx,stringLen
	call write

	; return
	call return

; ssize_t read(int fd, void *buf, size_t count);
; Read data from stdout, into 'buffer'.
read:
	mov eax,syscall_read ; syscall read
	mov ebx,stdin ; fd = 0
	int 80h
	ret
		
; ssize_t write(int fd, const void *buf, size_t count);
; Writes data from 'buffer' into STDOUT.
write:
	mov eax,syscall_write
	mov ebx,stdout
	int 80h
	ret

; Exits the program with return code '0'
return:
	mov eax,syscall_exit
	mov ebx,0
	int 80h
