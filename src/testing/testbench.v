module testbench();
	reg rst_n;
	wire clk;

	saumauping soc(
		.rst_n(rst_n),
		.clk(clk)
	);
	sys_clk_gen clk_gen(clk);

	initial begin
		rst_n <= 0;
		repeat(30) @(posedge clk);
		rst_n <= 1;
	end

	initial begin
		$dumpfile("impl/testbench.vcd");
		$dumpvars(0, testbench);
		//$display ("TEMP  DATA");
		//$monitor ("PB: %b, PC: %b, PD: %b", PB, PC, PD);
	end

	initial begin
		repeat(30000) @(posedge clk);
		$finish;
	end


endmodule
