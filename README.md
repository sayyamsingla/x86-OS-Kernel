# x86-OS-Kernel

A bare-metal x86 operating system kernel built from scratch in C and x86 assembly.
Inspired by [Nick Blundell's "Writing a Simple Operating System from Scratch"](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf).

## Project Structure

```
os-tutorial/
├── src/                    # Assembly source files
│   ├── boot_sect.asm       # Main boot sector entry point
│   ├── gdt.asm             # Global Descriptor Table
│   ├── switch_to_pm.asm    # Switch from real mode to protected mode
│   ├── disk_load.asm       # BIOS disk I/O routine
│   └── drivers/            # Low-level I/O drivers
│       ├── print_string.asm     # 16-bit real mode string output
│       ├── print_string_pm.asm  # 32-bit protected mode string output
│       └── print_hex.asm        # Hex value printer
├── build/                  # Compiled binaries (git-ignored)
│   └── boot_sect.bin
├── docs/                   # Reference material
│   └── WritingOS.pdf
├── Makefile
├── bochsrc                 # Bochs emulator config
└── README.md
```

## Build

Requires [NASM](https://www.nasm.us/) assembler.

```bash
make        # Assemble boot_sect.asm -> build/boot_sect.bin
make run    # Assemble and launch in Bochs
make clean  # Remove build artifacts
```
