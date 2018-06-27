# See LICENSE for license details.
base_dir := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
BUILD_DIR := $(base_dir)/builds
#MODEL := U500VC707DevKitFPGAChip
MODEL := SauMauPing
PROJECT := libresilicon.soc
export CONFIG_PROJECT := libresilicon.soc
#export CONFIG := U500VC707DevKitConfig
export CONFIG := SauMauPingConfig
export BOARD := vc707
export BOOTROM_DIR := $(base_dir)/bootrom/sdboot

rocketchip_dir := $(base_dir)/rocket-chip
sifiveblocks_dir := $(base_dir)/sifive-blocks
VSRCS := \
	$(rocketchip_dir)/src/main/resources/vsrc/AsyncResetReg.v \
	$(rocketchip_dir)/src/main/resources/vsrc/plusarg_reader.v \
	$(sifiveblocks_dir)/vsrc/SRLatch.v \
	$(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).rom.v \
	$(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).v

include common.mk
