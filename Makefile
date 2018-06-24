SIMULATION_BINARY=impl/testbench
all:
	iverilog -o ${SIMULATION_BINARY} src/testing/testbench.v
	./${SIMULATION_BINARY} 
clean:
	rm ./${SIMULATION_BINARY} 
