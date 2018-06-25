module sys_clk_gen (output reg sys_clk);
	parameter offset = 0;
	parameter halfcycle = 5000;

	initial begin
		sys_clk = 0;
		#(offset);
		forever #(halfcycle) sys_clk = ~sys_clk;
	end
endmodule // sys_clk_gen
