CC=nasm
CFLAGS=-f elf64
LD=ld -s  -o
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
