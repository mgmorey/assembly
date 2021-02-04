AS = nasm
CC = gcc

GCC_MAJOR = $(shell gcc --version | awk 'NR == 1 {print $$3}' | cut -d. -f1)
GCC_MAJOR_GT_4 = $(shell test $(GCC_MAJOR) -gt 4 && echo true || echo false)

ifeq "$(GCC_MAJOR_GT_4)" "true"
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
