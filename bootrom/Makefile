bootrom_img = bootrom.img

GCC=riscv64-elf-gcc
OBJCOPY=riscv64-elf-objcopy

all: $(bootrom_img)

%.img: %.bin
	dd if=$< of=$@ bs=128 count=1

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.elf: %.S linker.ld
	$(GCC) -Tlinker.ld $< -nostdlib -static -Wl,--no-gc-sections -o $@
