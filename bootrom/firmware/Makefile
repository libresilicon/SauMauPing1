# RISCV environment variable must be set

#CC=riscv64-suse-linux-gcc
CC=riscv64-elf-gcc 
OBJCOPY=riscv64-suse-linux-objcopy

CFLAGS+= -march=rv64imafdc
CFLAGS+= -mabi=lp64
CFLAGS+= -Os
CFLAGS+= -std=gnu11
CFLAGS+= -Wall -I.
CFLAGS+= -nostartfiles
CFLAGS+= -fno-common -g
CFLAGS+= -nostartfiles
CFLAGS+= -DXIP_TARGET_ADDR=0x80000000
#CFLAGS+= -DXIP_TARGET_ADDR=0x20000000
CFLAGS+= -Wl,--section-start=.text=0x1000
CFLAGS+= -static -nostdlib

CONFIG_PROJECT ?= libresilicon.soc
MODEL ?= SauMauPingMIA702
CONFIG ?= SauMauPingMIA702Config
BUILD_DIR ?= ../../builds
rocketchip_dir ?= ../../rocket-chip
sifiveblocks_dir ?= ../../sifive-blocks

dtb := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).dtb
$(dtb): $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).dts
	dtc -I dts -O dtb -o $@ $<

.PHONY: dtb
dtb: $(dtb)

elf := $(BUILD_DIR)/xip.elf
$(elf): xip.S $(dtb)
	$(CC) $(CFLAGS) -DDEVICE_TREE='"$(dtb)"' -o $@ $<
	#$(CC) $(CFLAGS) -DXIP_TARGET_ADDR=0x20400000 -DDEVICE_TREE='"$(dtb)"' $(LFLAGS) -o $@ $<

.PHONY: elf
elf: $(elf)

bin := $(BUILD_DIR)/xip.bin
$(bin): $(elf)
	$(OBJCOPY) -O binary $< $@

.PHONY: bin
bin: $(bin)

hex := $(BUILD_DIR)/xip.hex
$(hex): $(bin)
	od -t x4 -An -w4 -v $< > $@

.PHONY: hex
hex: $(hex)

romgen := $(BUILD_DIR)/rom.v
$(romgen): $(hex)
	$(rocketchip_dir)/scripts/vlsi_rom_gen $(ROMCONF) $< > $@

.PHONY: romgen
romgen: $(romgen)

.PHONY: clean
clean::
	rm -rf $(hex) $(elf) 
