# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Build the reverse-engineered source code of SSFII: TNC

# Settings

## Source settings
ROM :=				$(shell find -name "*.sfc" | sed 's/ /\\ /g')
ASM_FILE :=			ssfii-tnc.snes-asm
DECOMP_FLDR :=		dispel/
DECOMPILER :=		$(DECOMP_FLDR)dispel

# Targets

## Helper Targets

.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf $(ASM_FILE)

$(DECOMPILER): $(DECOMP_FLDR)
	$(MAKE) -C $(DECOMP_FLDR)

## Main targets

$(ASM_FILE): $(ROM) $(DECOMPILER)
	$(DECOMPILER) -o $@ "$<"

