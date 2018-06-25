SIMULATION_BINARY=impl/testbench
dirs+=src/testing
dirs+=src/device
dirs+=src/device/CPU
dirs+=src/device/CPU/freechips.rocketchip.system.DefaultConfig
dirs+=src/device/SD-card-controller/rtl/verilog

SEARCH_DIRS_OPTION=$(foreach dir,$(dirs),$(wildcard $(dir)/*.v))
INCLUDE_DIRS_OPTION=$(foreach dir,$(dirs),-I $(dir))

all:	clean
	iverilog -o ${SIMULATION_BINARY} ${INCLUDE_DIRS_OPTION} ${SEARCH_DIRS_OPTION} -s testbench
	./${SIMULATION_BINARY} 

clean:
	rm -f ./${SIMULATION_BINARY} 
