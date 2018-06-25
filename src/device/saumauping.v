
module saumauping #(
	parameter wbm_sdc_addr_width = 32,
	parameter wbm_sdc_data_width = 32,
	parameter wbs_d_sdc_data_width = 32
)
(
	input clk,
	input rst_n,
	inout sdc_cmd_pad_io,
	inout [3:0] sdc_dat_pad_io,
	output sdc_clk_pad_o
);

wire reset;
assign reset = !rst_n;

Rocket cpu(
	.clock(clk),
	.reset(rst_n)
);

// sdcard slave wires
wire [31:0] 			     wbs_d_sdc_adr_i;
wire [wbs_d_sdc_data_width-1:0]   wbs_d_sdc_dat_i;
wire [3:0] 			     wbs_d_sdc_sel_i;
wire 			     wbs_d_sdc_we_i;
wire 			     wbs_d_sdc_cyc_i;
wire 			     wbs_d_sdc_stb_i;
wire [2:0] 			     wbs_d_sdc_cti_i;
wire [1:0] 			     wbs_d_sdc_bte_i;
wire [wbs_d_sdc_data_width-1:0]   wbs_d_sdc_dat_o;
wire 			     wbs_d_sdc_ack_o;
wire 			     wbs_d_sdc_err_o;
wire 			     wbs_d_sdc_rty_o;

// sdcard master wires
wire [wbm_sdc_addr_width-1:0]     wbm_sdc_adr_o;
wire [wbm_sdc_data_width-1:0]     wbm_sdc_dat_o;
wire [3:0] 			     wbm_sdc_sel_o;
wire 			     wbm_sdc_we_o;
wire 			     wbm_sdc_cyc_o;
wire 			     wbm_sdc_stb_o;
wire [2:0] 			     wbm_sdc_cti_o;
wire [1:0] 			     wbm_sdc_bte_o;   
wire [wbm_sdc_data_width-1:0]     wbm_sdc_dat_i;   
wire 			     wbm_sdc_ack_i;
wire 			     wbm_sdc_err_i;
wire 			     wbm_sdc_rty_i;    

wire 			     sdc_cmd_oe;
wire 			     sdc_dat_oe;
wire 			     sdc_cmdIn;
wire [3:0] 			     sdc_datIn ;
wire 			     sdc_irq_a;
wire 			     sdc_irq_b;

assign sdc_cmd_pad_io = sdc_cmd_oe ? sdc_cmdIn : 1'bz;
assign sdc_dat_pad_io = sdc_dat_oe  ? sdc_datIn : 4'bzzzz;

assign wbs_d_sdc_err_o = 0;
assign wbs_d_sdc_rty_o= 0;

assign wbm_sdc_err_i = 0;
assign wbm_sdc_rty_i = 0;

sdc_controller sdc_controller_0 (
	.wb_clk_i (wb_clk),
	.wb_rst_i (wb_rst),
	.wb_dat_i (wbs_d_sdc_dat_i),
	.wb_dat_o (wbs_d_sdc_dat_o),
	.wb_adr_i (wbs_d_sdc_adr_i[7:0]),
	.wb_sel_i (4'hf),
	.wb_we_i  (wbs_d_sdc_we_i),
	.wb_stb_i (wbs_d_sdc_stb_i),
	.wb_cyc_i (wbs_d_sdc_cyc_i),
	.wb_ack_o (wbs_d_sdc_ack_o),

	.m_wb_adr_o (wbm_sdc_adr_o),
	.m_wb_sel_o (wbm_sdc_sel_o),
	.m_wb_we_o  (wbm_sdc_we_o),
	.m_wb_dat_o (wbm_sdc_dat_o),
	.m_wb_dat_i (wbm_sdc_dat_i),
	.m_wb_cyc_o (wbm_sdc_cyc_o),
	.m_wb_stb_o (wbm_sdc_stb_o),
	.m_wb_ack_i (wbm_sdc_ack_i),
	.m_wb_cti_o (wbm_sdc_cti_o),
	.m_wb_bte_o (wbm_sdc_bte_o),

	.sd_cmd_dat_i (sdc_cmd_pad_io),
	.sd_cmd_out_o (sdc_cmdIn ),
	.sd_cmd_oe_o  (sdc_cmd_oe),
	.sd_dat_dat_i (sdc_dat_pad_io  ),
	.sd_dat_out_o (sdc_datIn  ) ,
	.sd_dat_oe_o  (sdc_dat_oe  ),
	.sd_clk_o_pad (sdc_clk_pad_o),
	//.card_detect  (sdc_card_detect_pad_i),
	//.card_detect  (1'b1),

	.sd_clk_i_pad (wb_clk),

	.int_cmd (sdc_irq_a),
	.int_data (sdc_irq_b)
);

endmodule
