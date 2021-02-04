GCC_MAJOR := $(shell gcc -dumpversion | cut -d. -f1)
GCC_5_OR_NEWER := $(shell test $(GCC_MAJOR) -ge 5 && echo true || echo false)

ifeq "$(GCC_5_OR_NEWER)" "true"
	ASFLAGS += -F dwarf
	LDFLAGS += -no-pie
endif

ASFLAGS += -f elf64 -g
CC = gcc

COMPILE.asm = nasm $(ASFLAGS)
.SUFFIXES = .asm

%.o: %.asm
	$(COMPILE.asm) -l $*.lst -o $@ $<

%: %.o
	$(LINK.o) $(LDLIBS) -o $@ $^

.PHONY:	all
all: hello pi

.PHONY:	clean
clean:
	@/bin/rm -f hello pi *.lst *.o

hello.o: hello.asm

hello: hello.o

pi.o: pi.asm

pi: pi.o
