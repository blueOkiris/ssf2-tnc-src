# Decompilation of Super Street Fighter II - The New Challengers

## Description

Why? Why? Why?

The goal of this project is modding. I think it would be fun to tweak the SFII experience, and the SNES is well understood, and this is the version on the SNES.

Yeah, it's not Turbo. Weird decision, I know. However, if we get the source, we can speed it up anyway.

So yeah, I want to 1) build for PC, 2) upgrade graphics, 3) add mechanics, specifically parries from SFII Third Strike

There are no mods here, but rather one should use this as a basis for making further projects.

## Building

Deps:
- \*nix
- make
- gcc

Just run `make`

## Decompilation (to C)

This is just to update/create the original assembly source for reference. It's only used by developers. If you just want the recreated project, follow the basic build instructions above.

Deps:
- You need a ROM. I cannot give you a ROM. You must get a cartridge and rip it yourself.
- gcc
- make
- \*nix

Run:

```
git submodule init
git submodule update --remote --checkout
make ssfii-tnc.snes-asm
```

