# See LICENSE for license details.

# Required variables:
# - MODEL
# - PROJECT
# - CONFIG_PROJECT
# - CONFIG
# - BUILD_DIR
# - FPGA_DIR

# Optional variables:
# - EXTRA_FPGA_VSRCS

# export to bootloader
export ROMCONF=$(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).rom.conf

# export to fpga-shells
export FPGA_TOP_SYSTEM=$(MODEL)
export FPGA_BUILD_DIR=$(BUILD_DIR)/$(FPGA_TOP_SYSTEM)
export fpga_common_script_dir=$(FPGA_DIR)/common/tcl
export fpga_board_script_dir=$(FPGA_DIR)/$(BOARD)/tcl

export BUILD_DIR

EXTRA_FPGA_VSRCS ?=
PATCHVERILOG ?= ""
BOOTROM_DIR ?= ""

base_dir := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
export rocketchip_dir = $(base_dir)/rocket-chip
export sbt=java -jar $(rocketchip_dir)/sbt-launch.jar ++2.12.4

# Build firrtl.jar and put it where chisel3 can find it.
FIRRTL_JAR ?= $(rocketchip_dir)/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -cp $(FIRRTL_JAR) firrtl.Driver

$(FIRRTL_JAR): $(shell find $(rocketchip_dir)/firrtl/src/main/scala -iname "*.scala")
	$(MAKE)  root_dir=$(rocketchip_dir)/firrtl -C $(rocketchip_dir)/firrtl build-scala SBT="$(sbt)"
	touch $(FIRRTL_JAR)
	mkdir -p $(rocketchip_dir)/lib
	cp -p $(FIRRTL_JAR) rocket-chip/lib
	mkdir -p $(rocketchip_dir)/chisel3/lib
	cp -p $(FIRRTL_JAR) $(rocketchip_dir)/chisel3/lib

# Build .fir
firrtl := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).fir
$(firrtl): $(shell find $(base_dir)/src/main/scala -name '*.scala') $(FIRRTL_JAR)
	mkdir -p $(dir $@)
	$(sbt) "runMain freechips.rocketchip.system.Generator $(BUILD_DIR) $(PROJECT) $(MODEL) $(CONFIG_PROJECT) $(CONFIG)"

.PHONY: firrtl
firrtl: $(firrtl)

# Build .v
verilog := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).v
$(verilog): $(firrtl) $(FIRRTL_JAR)
	$(FIRRTL) -i $(firrtl) -o $@ -X verilog
ifneq ($(PATCHVERILOG),"")
	$(PATCHVERILOG)
endif

.PHONY: verilog
verilog: $(verilog)

png: verilog
	$(sbt) "runMain fir2dot.Main $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).fir"
	mkdir -p $(BUILD_DIR)/dot
	mkdir -p $(BUILD_DIR)/png
	mv *.dot $(BUILD_DIR)/dot
	for i in $(BUILD_DIR)/dot/*.dot; do \
		echo $$i && dot -s0.1 -Tpng $$i -o `echo $$i | sed -e 's/dot/png/g'`; \
	done

svg: verilog
	$(sbt) "runMain fir2dot.Main $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).fir"
	mkdir -p $(BUILD_DIR)/dot
	mkdir -p $(BUILD_DIR)/svg
	mv *.dot $(BUILD_DIR)/dot
	for i in $(BUILD_DIR)/dot/*.dot; do \
		echo $$i && dot -s0.1 -Tsvg $$i -o `echo $$i | sed -e 's/dot/svg/g'`; \
	done

viewer: verilog
	$(sbt) "runMain firviewer.Main --top=$(MODEL) --fir=$(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).fir"

romgen := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).rom.v
$(romgen): $(verilog)
ifneq ($(BOOTROM_DIR),"")
	$(MAKE) -C $(BOOTROM_DIR) romgen
	mv $(BUILD_DIR)/rom.v $@
endif

.PHONY: romgen
romgen: $(romgen)

f := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).vsrcs.F
$(f):
	echo $(VSRCS) > $@

bit := $(BUILD_DIR)/obj/$(MODEL).bit
$(bit): $(romgen) $(f)
	cd $(BUILD_DIR); vivado \
		-nojournal -mode batch \
		-source $(fpga_common_script_dir)/vivado.tcl \
		-tclargs \
		-top-module "$(MODEL)" \
		-F "$(f)" \
		-ip-vivado-tcls "$(shell find '$(BUILD_DIR)' -name '*.vivado.tcl')" \
		-board "$(BOARD)"


# Build .mcs
mcs := $(BUILD_DIR)/obj/$(MODEL).mcs
$(mcs): $(bit)
	cd $(BUILD_DIR); vivado -nojournal -mode batch -source $(fpga_common_script_dir)/write_cfgmem.tcl -tclargs $(BOARD) $@ $<

.PHONY: mcs
mcs: $(mcs)

# Build Libero project
prjx := $(BUILD_DIR)/libero/$(MODEL).prjx
$(prjx): $(verilog)
	cd $(BUILD_DIR); libero SCRIPT:$(fpga_common_script_dir)/libero.tcl SCRIPT_ARGS:"$(BUILD_DIR) $(MODEL) $(PROJECT) $(CONFIG) $(BOARD)"

.PHONY: prjx
prjx: $(prjx)

# Clean
.PHONY: clean
clean:
ifneq ($(BOOTROM_DIR),"")
	$(MAKE) -C $(BOOTROM_DIR) clean
endif
	$(MAKE) -C $(FPGA_DIR) clean
	rm -rf $(BUILD_DIR)

dtb := $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).dtb
$(dtb): $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).dts
	dtc -I dts -O dtb -o $@ $<

boom:
	make -f riscv-boom/Makefile

sim_dir := $(base_dir)/vsim
sim: romgen $(dtb)
	mkdir -p $(sim_dir) && \
	cd $(sim_dir) && \
	verilator --cc --exe \
	--top-module $(MODEL) --trace \
	+define+RANDOMIZE_GARBAGE_ASSIGN \
	+define+RANDOMIZE_REG_INIT \
	+define+RANDOMIZE_MEM_INIT \
	--assert --output-split 20000 --output-split-cfuncs 20000 -Wno-STMTDLY --x-assign unique \
	-O3 -CFLAGS "-O1 -std=c++11 -I/usr/include -DTEST_HARNESS=V$(MODEL) -DVERILATOR -include $(rocketchip_dir)/src/main/resources/csrc/verilator.h -include $(BUILD_DIR)/$(CONFIG_PROJECT).$(CONFIG).plusArgs" \
	-Mdir $(sim_dir) \
	-o $(sim_dir)/emulator \
	-I$(rocketchip_dir)/src/main/resources/vsrc \
	$(VSRCS) \
	$(CSRCS) \
	-LDFLAGS " -L/usr/lib -Wl,-rpath,/usr/lib -lfesvr -lpthread" \
	-CFLAGS "-I$(rocketchip_dir)/src/main/resources/csrc -I$(sim_dir) -include $(sim_dir)/V$(MODEL).h" && \
	make -f V$(MODEL).mk
