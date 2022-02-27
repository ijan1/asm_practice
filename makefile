CC=nasm
CFLAGS64=-f elf64
CFLAGS=-f elf32
LD64=ld -s -o
LD=ld -m elf_i386 -s -o
all: main

hello:	hello_world.asm
	$(CC) $(CFLAGS) hello_world.asm
	$(LD) hello_world hello_world.o

read:	read.asm
	$(CC) $(CFLAGS) read.asm
	$(LD) read read.o

snake:	snake.asm
	$(CC) $(CFLAGS) snake.asm
	$(LD) snake snake.o

clean:
	rm -f hello_world hello_world.o read read.o snake snake.o
