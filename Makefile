SIMULATION_BINARY=impl/testbench
all:	clean
	iverilog -o ${SIMULATION_BINARY} src/testing/testbench.v
simulate:	all
	./${SIMULATION_BINARY} 
clean:
	rm -f ./${SIMULATION_BINARY} 
