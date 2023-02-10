# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Build the reverse-engineered source code of SSFII: TNC

# Settings

## Decomp settings

ROM :=				$(shell find -name "*.sfc" | sed 's/ /\\ /g')
ASM_FILE :=			ssfii-tnc.snes-asm
DECOMP_FLDR :=		dispel/
DECOMPILER :=		$(DECOMP_FLDR)dispel

## Compiler settings

CC :=				gcc
CFLAGS :=			-Wall -Werror -O2 \
					-Iinclude
LD :=				gcc
LDFLAGS :=			

## Project settings

OBJNAME :=			ssfii-tnc
SRC :=				$(wildcard src/*.c)
HFILES :=			$(wildcard include/*.h)
OBJS :=				$(subst src/,obj/,$(subst .c,.o,$(SRC)))

# Targets

## Helper Targets

.PHONY: all
all: $(OBJNAME)

.PHONY: clean
clean:
	rm -rf $(ASM_FILE)
	rm -rf obj/
	rm -rf $(OBJNAME)

$(DECOMPILER): $(DECOMP_FLDR)
	$(MAKE) -C $(DECOMP_FLDR)

obj/%.o: src/%.c $(HFILES)
	mkdir -p obj/
	$(CC) $(CFLAGS) -c $< -o $@

## Main targets

$(ASM_FILE): $(ROM) $(DECOMPILER)
	$(DECOMPILER) -o $@ "$<"

$(OBJNAME): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

