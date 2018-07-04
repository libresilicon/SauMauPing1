`define SIMULATION

`define CLOCK_PERIOD 1
`ifndef RESET_DELAY
`define RESET_DELAY 100
`endif

module TestDriver;
`ifdef den1024Mb
	`include "1024Mb_ddr3_parameters.vh"
`elsif den2048Mb
	`include "2048Mb_ddr3_parameters.vh"
`elsif den4096Mb
	`include "4096Mb_ddr3_parameters.vh"
`elsif den8192Mb
	`include "8192Mb_ddr3_parameters.vh"
`endif

reg [1023:0] vcdfile = 0;

reg clock = 1'b0;
reg reset_n = 1'b0;

always #(`CLOCK_PERIOD/2.0) clock = ~clock;
initial #(`RESET_DELAY) reset_n = 1;

initial
begin
	if ($value$plusargs("vcdfile=%s", vcdfile))
	begin
	$dumpfile(vcdfile);
	$dumpvars(0, testHarness);
	end
end

// simulating RAM
wire   ddr3_rst_n;
wire   ddr3_ck;
wire   ddr3_ck_n;
wire   ddr3_cke;
wire   ddr3_cs_n;
wire   ddr3_ras_n;
wire   ddr3_cas_n;
wire   ddr3_we_n;
wire   [(2*DM_BITS)-1:0]   ddr3_dm_tdqs;
wire   [(2*BA_BITS)-1:0]   ddr3_ba;
wire   [(2*ADDR_BITS)-1:0] ddr3_addr;
wire   [(2*DQ_BITS)-1:0]   ddr3_dq;
wire   [(2*DQS_BITS)-1:0]  ddr3_dqs;
wire   [(2*DQS_BITS)-1:0]  ddr3_dqs_n;
wire   [(2*DQS_BITS)-1:0]  ddr3_tdqs_n;
wire   ddr3_odt;

ddr3 dram1 (
	.rst_n(ddr3_rst_n),
	.ck(ddr3_ck),
	.ck_n(ddr3_ck_n),
	.cke(ddr3_cke),
	.cs_n(ddr3_cs_n),
	.ras_n(ddr3_ras_n),
	.cas_n(ddr3_cas_n),
	.we_n(ddr3_we_n),
	.dm_tdqs(ddr3_dm_tdqs[(2*DM_BITS)-1:DM_BITS]),
	.ba(ddr3_ba[(2*BA_BITS)-1:BA_BITS]),
	.addr(ddr3_addr[(2*ADDR_BITS)-1:ADDR_BITS]),
	.dq(ddr3_dq[(2*DQ_BITS)-1:DQ_BITS]),
	.dqs(ddr3_dqs[(2*DQS_BITS)-1:DQS_BITS]),
	.dqs_n(ddr3_dqs_n[(2*DQS_BITS)-1:DQS_BITS]),
	.tdqs_n(ddr3_tdqs_n[(2*DQS_BITS)-1:DQS_BITS]),
	.odt(ddr3_odt)
);

ddr3 dram2 (
	.rst_n(ddr3_rst_n),
	.ck(ddr3_ck),
	.ck_n(ddr3_ck_n),
	.cke(ddr3_cke),
	.cs_n(ddr3_cs_n),
	.ras_n(ddr3_ras_n),
	.cas_n(ddr3_cas_n),
	.we_n(ddr3_we_n),
	.dm_tdqs(ddr3_dm_tdqs[(DM_BITS-1):0]),
	.ba(ddr3_ba[(BA_BITS-1):0]),
	.addr(ddr3_addr[(ADDR_BITS-1):0]),
	.dq(ddr3_dq[(DQ_BITS-1):0]),
	.dqs(ddr3_dqs[(DQS_BITS-1):0]),
	.dqs_n(ddr3_dqs_n[(DQS_BITS-1):0]),
	.tdqs_n(ddr3_tdqs_n[(DQS_BITS-1):0]),
	.odt(ddr3_odt)
);

// sd card
wire sdio_clk;
wire sdio_cmd;
wire[3:0] sdio_dat;

sdModel #(
.ramdisk("/home/leviathan/SauMauPing1/sdcard_image.bin")
) sd (
.sdClk(sdio_clk),
.cmd(sdio_cmd),
.dat(sdio_dat)
);

// QSPI
wire qspi_SI = 1'b0;
wire qspi_SO = 1'b0;
wire qspi_SCK = 1'b0;
wire qspi_CSNeg = 1'b0;
wire qspi_RSTNeg = 1'b0;
wire qspi_HOLDNeg = 1'b0;
wire qspi_WPNeg = 1'b0;

s25fl256s #(
    //.mem_file_name("/home/leviathan/SauMauPing1/builds/xip.hex")
    .mem_file_name("/home/leviathan/SauMauPing1/sdcard_image.bin")
)
qspi(
    .SI(qspi_SI),
    .SO(qspi_SO),
    .SCK(qspi_SCK),
    .CSNeg(qspi_CSNeg),
    .RSTNeg(qspi_RSTNeg),
    .WPNeg(qspi_WPNeg),
    .HOLDNeg(qspi_HOLDNeg)
);

// the actual SoC:
SauMauPingMIA702 testHarness(
	.clock(clock),
	.resetn(reset_n),
	// DDR3
	.ddr_ddr3_addr(ddr3_addr),
	.ddr_ddr3_ba(ddr3_ba),
	.ddr_ddr3_ras_n(ddr3_ras_n), 
	.ddr_ddr3_cas_n(ddr3_cas_n), 
	.ddr_ddr3_we_n(ddr3_we_n), 
	.ddr_ddr3_reset_n(ddr3_rst_n),
	.ddr_ddr3_ck_p(ddr3_ck), 
	.ddr_ddr3_ck_n(ddr3_ck_n), 
	.ddr_ddr3_cke(ddr3_cke), 
	.ddr_ddr3_cs_n(ddr3_cs_n), 
	.ddr_ddr3_dm(ddr3_dm_tdqs), 
	.ddr_ddr3_odt(ddr3_odt), 
	.ddr_ddr3_dq(ddr3_dq), 
	.ddr_ddr3_dqs_n(ddr3_dqs_n), 
	.ddr_ddr3_dqs_p(ddr3_dqs),

	// SD card
	.sdio_clk(sdio_clk),
	.sdio_cmd(sdio_cmd),
	.sdio_dat(sdio_dat),

	// QSPI
	.qspi_cs(qspi_CSNeg),
	.qspi_sck(qspi_SCK),
	.qspi_dq_0(qspi_SI),
	.qspi_dq_1(qspi_SO),
	.qspi_dq_2(),
	.qspi_dq_3()
);

endmodule