# GNUmakefile for hello.asm

all:		hello

clean:
	rm -f hello hello.o hello.lst

hello:		hello.o
	gcc -no-pie -o hello hello.o

hello.o:	hello.asm
	nasm -F dwarf -f elf64 -g -l hello.lst hello.asm

.pseudo:	all clean
