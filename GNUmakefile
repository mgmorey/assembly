AS = nasm
CC = gcc

GCC_MAJOR = $(shell gcc -dumpversion | cut -d. -f1)
GCC_5_OR_NEWER = $(shell test $(GCC_MAJOR) -ge 5 && echo true || echo false)

ifeq "$(GCC_5_OR_NEWER)" "true"
	ASFLAGS = -F dwarf -f elf64 -g
	LDFLAGS = -no-pie
else
	ASFLAGS = -f elf64 -g
	LDFLAGS =
endif

COMPILE.s = $(AS) $(ASFLAGS) $(TARGET_MACH)
LINK.o = $(CC) $(LDFLAGS) $(TARGET_ARCH)

.PHONY:	clean
all: hello pi

.PHONY:	clean
clean:
	@/bin/rm -f hello pi *.lst *.o

hello: hello.o

hello.o: hello.asm

pi: pi.o

pi.o: pi.asm

%: %.o
	$(LINK.o) $(LOADLIBES) $(LDLIBS) -o $@ $^

%.o: %.asm
	$(COMPILE.s) -l $*.lst -o $@ $<
