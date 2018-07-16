# See LICENSE for license details.
export base_dir = $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

# binaries:
export CC=/usr/bin/riscv64-elf-gcc
export OBJCOPY=/usr/bin/riscv64-elf-objcopy

export BUILD_DIR = $(base_dir)/builds
export PROJECT = libresilicon.soc
export CONFIG_PROJECT = libresilicon.soc
export MODEL = SauMauPing
#export MODEL = SauMauPingTestHarness
export CONFIG = SauMauPingConfig
export BOOTROM_DIR = $(base_dir)/bootrom/firmware
export VIEWER_DEPTH=0

ICARUS_OPTION += -g2012
ICARUS_OPTION += -DRANDOMIZE_GARBAGE_ASSIGN=1
ICARUS_OPTION += -DRANDOMIZE_REG_INIT=1
ICARUS_OPTION += -DRANDOMIZE_MEM_INIT=1
ICARUS_OPTION += -DRANDOMIZE_INVALID_ASSIGN=1
ICARUS_OPTION += -DRANDOMIZE=1
export ICARUS_OPTION

vsrc=$(rocketchip_dir)/src/main/resources/vsrc
csrc=$(rocketchip_dir)/src/main/resources/csrc

rocketchip_dir := $(base_dir)/rocket-chip
sifiveblocks_dir := $(base_dir)/sifive-blocks

VSRCS += $(sifiveblocks_dir)/vsrc/SRLatch.v
VSRCS += $(rocketchip_dir)/src/main/resources/vsrc/AsyncResetReg.v
VSRCS += $(rocketchip_dir)/src/main/resources/vsrc/plusarg_reader.v
VSRCS += $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).rom.v
VSRCS += $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).v
export VSRCS

CSRCS += $(base_dir)/src/main/resources/csrc/emulator.cc
CSRCS += $(rocketchip_dir)/src/main/resources/csrc/remote_bitbang.cc
CSRCS += $(rocketchip_dir)/src/main/resources/csrc/SimDTM.cc
CSRCS += $(rocketchip_dir)/src/main/resources/csrc/SimJTAG.cc
export CSRCS

include common.mk
