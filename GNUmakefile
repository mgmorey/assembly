all:		hello pi

clean:
	rm -f hello hello.o hello.lst

hello:		hello.o
	gcc -no-pie -o hello hello.o

hello.o:	hello.asm
	nasm -F dwarf -f elf64 -g -l hello.lst hello.asm

pi:		pi.o
	gcc -no-pie -o pi pi.o

pi.o:	pi.asm
	nasm -F dwarf -f elf64 -g -l pi.lst pi.asm

.pseudo:	all clean
