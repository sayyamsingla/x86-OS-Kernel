ASM       = nasm
ASMFLAGS  = -f bin

SRC_DIR   = src
BUILD_DIR = build

TARGET    = $(BUILD_DIR)/boot_sect.bin

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC_DIR)/boot_sect.asm
	mkdir -p $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

run: $(TARGET)
	bochs -f bochsrc -q

clean:
	rm -f $(BUILD_DIR)/*.bin
