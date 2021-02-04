ifeq "$(shell bin/nasm-has-dwarf)" "true"
	ASFLAGS += -F dwarf
endif
ifeq "$(shell bin/gcc-has-no-pie)" "true"
	LDFLAGS += -no-pie
endif

ASFLAGS += -f elf64 -g
CC = gcc

COMPILE.asm = nasm $(ASFLAGS)
.SUFFIXES = .asm

sources = hello.asm pi.asm
listings = $(subst .asm,.lst,$(sources))
objects = $(subst .asm,.o,$(sources))
binaries = $(subst .asm,,$(sources))

%.o: %.asm
	$(COMPILE.asm) -l $*.lst -o $@ $<

%: %.o
	$(LINK.o) $(LDLIBS) -o $@ $^

.PHONY:	all
all: $(binaries)

.PHONY:	clean
clean:
	/bin/rm -f $(binaries) $(objects) $(listings)

hello.o: hello.asm

hello: hello.o

pi.o: pi.asm

pi: pi.o
