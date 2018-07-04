create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list u_mig_7series_0/u_mig_7series_0_mig/u_ddr3_infrastructure/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 30 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {CountRead[0]} {CountRead[1]} {CountRead[2]} {CountRead[3]} {CountRead[4]} {CountRead[5]} {CountRead[6]} {CountRead[7]} {CountRead[8]} {CountRead[9]} {CountRead[10]} {CountRead[11]} {CountRead[12]} {CountRead[13]} {CountRead[14]} {CountRead[15]} {CountRead[16]} {CountRead[17]} {CountRead[18]} {CountRead[19]} {CountRead[20]} {CountRead[21]} {CountRead[22]} {CountRead[23]} {CountRead[24]} {CountRead[25]} {CountRead[26]} {CountRead[27]} {CountRead[28]} {CountRead[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 30 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {CountWrite[0]} {CountWrite[1]} {CountWrite[2]} {CountWrite[3]} {CountWrite[4]} {CountWrite[5]} {CountWrite[6]} {CountWrite[7]} {CountWrite[8]} {CountWrite[9]} {CountWrite[10]} {CountWrite[11]} {CountWrite[12]} {CountWrite[13]} {CountWrite[14]} {CountWrite[15]} {CountWrite[16]} {CountWrite[17]} {CountWrite[18]} {CountWrite[19]} {CountWrite[20]} {CountWrite[21]} {CountWrite[22]} {CountWrite[23]} {CountWrite[24]} {CountWrite[25]} {CountWrite[26]} {CountWrite[27]} {CountWrite[28]} {CountWrite[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 24 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Count_64[0]} {Count_64[1]} {Count_64[2]} {Count_64[3]} {Count_64[4]} {Count_64[5]} {Count_64[6]} {Count_64[7]} {Count_64[8]} {Count_64[9]} {Count_64[10]} {Count_64[11]} {Count_64[12]} {Count_64[13]} {Count_64[14]} {Count_64[15]} {Count_64[16]} {Count_64[17]} {Count_64[18]} {Count_64[19]} {Count_64[20]} {Count_64[21]} {Count_64[22]} {Count_64[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 24 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Count_64_1[0]} {Count_64_1[1]} {Count_64_1[2]} {Count_64_1[3]} {Count_64_1[4]} {Count_64_1[5]} {Count_64_1[6]} {Count_64_1[7]} {Count_64_1[8]} {Count_64_1[9]} {Count_64_1[10]} {Count_64_1[11]} {Count_64_1[12]} {Count_64_1[13]} {Count_64_1[14]} {Count_64_1[15]} {Count_64_1[16]} {Count_64_1[17]} {Count_64_1[18]} {Count_64_1[19]} {Count_64_1[20]} {Count_64_1[21]} {Count_64_1[22]} {Count_64_1[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 256 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {app_rd_data_tem[0]} {app_rd_data_tem[1]} {app_rd_data_tem[2]} {app_rd_data_tem[3]} {app_rd_data_tem[4]} {app_rd_data_tem[5]} {app_rd_data_tem[6]} {app_rd_data_tem[7]} {app_rd_data_tem[8]} {app_rd_data_tem[9]} {app_rd_data_tem[10]} {app_rd_data_tem[11]} {app_rd_data_tem[12]} {app_rd_data_tem[13]} {app_rd_data_tem[14]} {app_rd_data_tem[15]} {app_rd_data_tem[16]} {app_rd_data_tem[17]} {app_rd_data_tem[18]} {app_rd_data_tem[19]} {app_rd_data_tem[20]} {app_rd_data_tem[21]} {app_rd_data_tem[22]} {app_rd_data_tem[23]} {app_rd_data_tem[24]} {app_rd_data_tem[25]} {app_rd_data_tem[26]} {app_rd_data_tem[27]} {app_rd_data_tem[28]} {app_rd_data_tem[29]} {app_rd_data_tem[30]} {app_rd_data_tem[31]} {app_rd_data_tem[32]} {app_rd_data_tem[33]} {app_rd_data_tem[34]} {app_rd_data_tem[35]} {app_rd_data_tem[36]} {app_rd_data_tem[37]} {app_rd_data_tem[38]} {app_rd_data_tem[39]} {app_rd_data_tem[40]} {app_rd_data_tem[41]} {app_rd_data_tem[42]} {app_rd_data_tem[43]} {app_rd_data_tem[44]} {app_rd_data_tem[45]} {app_rd_data_tem[46]} {app_rd_data_tem[47]} {app_rd_data_tem[48]} {app_rd_data_tem[49]} {app_rd_data_tem[50]} {app_rd_data_tem[51]} {app_rd_data_tem[52]} {app_rd_data_tem[53]} {app_rd_data_tem[54]} {app_rd_data_tem[55]} {app_rd_data_tem[56]} {app_rd_data_tem[57]} {app_rd_data_tem[58]} {app_rd_data_tem[59]} {app_rd_data_tem[60]} {app_rd_data_tem[61]} {app_rd_data_tem[62]} {app_rd_data_tem[63]} {app_rd_data_tem[64]} {app_rd_data_tem[65]} {app_rd_data_tem[66]} {app_rd_data_tem[67]} {app_rd_data_tem[68]} {app_rd_data_tem[69]} {app_rd_data_tem[70]} {app_rd_data_tem[71]} {app_rd_data_tem[72]} {app_rd_data_tem[73]} {app_rd_data_tem[74]} {app_rd_data_tem[75]} {app_rd_data_tem[76]} {app_rd_data_tem[77]} {app_rd_data_tem[78]} {app_rd_data_tem[79]} {app_rd_data_tem[80]} {app_rd_data_tem[81]} {app_rd_data_tem[82]} {app_rd_data_tem[83]} {app_rd_data_tem[84]} {app_rd_data_tem[85]} {app_rd_data_tem[86]} {app_rd_data_tem[87]} {app_rd_data_tem[88]} {app_rd_data_tem[89]} {app_rd_data_tem[90]} {app_rd_data_tem[91]} {app_rd_data_tem[92]} {app_rd_data_tem[93]} {app_rd_data_tem[94]} {app_rd_data_tem[95]} {app_rd_data_tem[96]} {app_rd_data_tem[97]} {app_rd_data_tem[98]} {app_rd_data_tem[99]} {app_rd_data_tem[100]} {app_rd_data_tem[101]} {app_rd_data_tem[102]} {app_rd_data_tem[103]} {app_rd_data_tem[104]} {app_rd_data_tem[105]} {app_rd_data_tem[106]} {app_rd_data_tem[107]} {app_rd_data_tem[108]} {app_rd_data_tem[109]} {app_rd_data_tem[110]} {app_rd_data_tem[111]} {app_rd_data_tem[112]} {app_rd_data_tem[113]} {app_rd_data_tem[114]} {app_rd_data_tem[115]} {app_rd_data_tem[116]} {app_rd_data_tem[117]} {app_rd_data_tem[118]} {app_rd_data_tem[119]} {app_rd_data_tem[120]} {app_rd_data_tem[121]} {app_rd_data_tem[122]} {app_rd_data_tem[123]} {app_rd_data_tem[124]} {app_rd_data_tem[125]} {app_rd_data_tem[126]} {app_rd_data_tem[127]} {app_rd_data_tem[128]} {app_rd_data_tem[129]} {app_rd_data_tem[130]} {app_rd_data_tem[131]} {app_rd_data_tem[132]} {app_rd_data_tem[133]} {app_rd_data_tem[134]} {app_rd_data_tem[135]} {app_rd_data_tem[136]} {app_rd_data_tem[137]} {app_rd_data_tem[138]} {app_rd_data_tem[139]} {app_rd_data_tem[140]} {app_rd_data_tem[141]} {app_rd_data_tem[142]} {app_rd_data_tem[143]} {app_rd_data_tem[144]} {app_rd_data_tem[145]} {app_rd_data_tem[146]} {app_rd_data_tem[147]} {app_rd_data_tem[148]} {app_rd_data_tem[149]} {app_rd_data_tem[150]} {app_rd_data_tem[151]} {app_rd_data_tem[152]} {app_rd_data_tem[153]} {app_rd_data_tem[154]} {app_rd_data_tem[155]} {app_rd_data_tem[156]} {app_rd_data_tem[157]} {app_rd_data_tem[158]} {app_rd_data_tem[159]} {app_rd_data_tem[160]} {app_rd_data_tem[161]} {app_rd_data_tem[162]} {app_rd_data_tem[163]} {app_rd_data_tem[164]} {app_rd_data_tem[165]} {app_rd_data_tem[166]} {app_rd_data_tem[167]} {app_rd_data_tem[168]} {app_rd_data_tem[169]} {app_rd_data_tem[170]} {app_rd_data_tem[171]} {app_rd_data_tem[172]} {app_rd_data_tem[173]} {app_rd_data_tem[174]} {app_rd_data_tem[175]} {app_rd_data_tem[176]} {app_rd_data_tem[177]} {app_rd_data_tem[178]} {app_rd_data_tem[179]} {app_rd_data_tem[180]} {app_rd_data_tem[181]} {app_rd_data_tem[182]} {app_rd_data_tem[183]} {app_rd_data_tem[184]} {app_rd_data_tem[185]} {app_rd_data_tem[186]} {app_rd_data_tem[187]} {app_rd_data_tem[188]} {app_rd_data_tem[189]} {app_rd_data_tem[190]} {app_rd_data_tem[191]} {app_rd_data_tem[192]} {app_rd_data_tem[193]} {app_rd_data_tem[194]} {app_rd_data_tem[195]} {app_rd_data_tem[196]} {app_rd_data_tem[197]} {app_rd_data_tem[198]} {app_rd_data_tem[199]} {app_rd_data_tem[200]} {app_rd_data_tem[201]} {app_rd_data_tem[202]} {app_rd_data_tem[203]} {app_rd_data_tem[204]} {app_rd_data_tem[205]} {app_rd_data_tem[206]} {app_rd_data_tem[207]} {app_rd_data_tem[208]} {app_rd_data_tem[209]} {app_rd_data_tem[210]} {app_rd_data_tem[211]} {app_rd_data_tem[212]} {app_rd_data_tem[213]} {app_rd_data_tem[214]} {app_rd_data_tem[215]} {app_rd_data_tem[216]} {app_rd_data_tem[217]} {app_rd_data_tem[218]} {app_rd_data_tem[219]} {app_rd_data_tem[220]} {app_rd_data_tem[221]} {app_rd_data_tem[222]} {app_rd_data_tem[223]} {app_rd_data_tem[224]} {app_rd_data_tem[225]} {app_rd_data_tem[226]} {app_rd_data_tem[227]} {app_rd_data_tem[228]} {app_rd_data_tem[229]} {app_rd_data_tem[230]} {app_rd_data_tem[231]} {app_rd_data_tem[232]} {app_rd_data_tem[233]} {app_rd_data_tem[234]} {app_rd_data_tem[235]} {app_rd_data_tem[236]} {app_rd_data_tem[237]} {app_rd_data_tem[238]} {app_rd_data_tem[239]} {app_rd_data_tem[240]} {app_rd_data_tem[241]} {app_rd_data_tem[242]} {app_rd_data_tem[243]} {app_rd_data_tem[244]} {app_rd_data_tem[245]} {app_rd_data_tem[246]} {app_rd_data_tem[247]} {app_rd_data_tem[248]} {app_rd_data_tem[249]} {app_rd_data_tem[250]} {app_rd_data_tem[251]} {app_rd_data_tem[252]} {app_rd_data_tem[253]} {app_rd_data_tem[254]} {app_rd_data_tem[255]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 4 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {state[0]} {state[1]} {state[2]} {state[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {state1[0]} {state1[1]} {state1[2]} {state1[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list error_rddata]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list init_calib_complete_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list ProsessIn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list ProsessIn1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list WriteSign]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]

set_property PACKAGE_PIN AA11 [get_ports {sdio_dat[3]}]
set_property PACKAGE_PIN AB11 [get_ports {sdio_dat[2]}]
set_property PACKAGE_PIN W16 [get_ports {sdio_dat[1]}]
set_property PACKAGE_PIN Y16 [get_ports {sdio_dat[0]}]
set_property PACKAGE_PIN U16 [get_ports sdio_clk]
set_property PACKAGE_PIN T16 [get_ports sdio_cmd]
set_property PACKAGE_PIN M16 [get_ports sdio_cd]

set_property PACKAGE_PIN AB10 [get_ports uart_tx]
set_property PACKAGE_PIN AA10 [get_ports uart_rx]

set_property IOSTANDARD LVCMOS33 [get_ports {sdio_dat[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_dat[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_dat[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_dat[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TCK]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TDI]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TDO]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_TMS]
set_property IOSTANDARD LVCMOS33 [get_ports sdio_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sw_0]
set_property IOSTANDARD LVCMOS33 [get_ports sw_1]
set_property IOSTANDARD LVCMOS33 [get_ports sw_2]
set_property IOSTANDARD LVCMOS33 [get_ports sw_4]
set_property IOSTANDARD LVCMOS33 [get_ports sw_3]
set_property IOSTANDARD LVCMOS33 [get_ports sdio_cmd]
set_property IOSTANDARD LVCMOS33 [get_ports led_0]
set_property IOSTANDARD LVCMOS33 [get_ports led_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_2]
set_property IOSTANDARD LVCMOS33 [get_ports led_3]
set_property IOSTANDARD LVCMOS33 [get_ports led_4]
set_property IOSTANDARD LVCMOS33 [get_ports led_6]
set_property IOSTANDARD LVCMOS33 [get_ports led_5]
set_property IOSTANDARD LVCMOS33 [get_ports led_7]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtsn]
set_property IOSTANDARD LVCMOS33 [get_ports uart_ctsn]
set_property IOSTANDARD LVCMOS33 [get_ports sw_7]
set_property IOSTANDARD LVCMOS33 [get_ports sw_6]
set_property IOSTANDARD LVCMOS33 [get_ports sw_5]
set_property IOSTANDARD LVCMOS33 [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN V13 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]

set_property PACKAGE_PIN F21 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN J16 [get_ports gpio_leds_0]
set_property PACKAGE_PIN K16 [get_ports gpio_leds_1]
set_property PACKAGE_PIN L16 [get_ports gpio_leds_2]
set_property PACKAGE_PIN M17 [get_ports gpio_leds_3]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_leds_0]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_leds_1]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_leds_2]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_leds_3]

set_property PACKAGE_PIN P22 [get_ports qspi_dq_0]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_dq_0]
set_property PACKAGE_PIN R22 [get_ports qspi_dq_1]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_dq_1]
set_property PACKAGE_PIN P21 [get_ports qspi_dq_2]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_dq_2]
set_property PACKAGE_PIN R21 [get_ports qspi_dq_3]
set_property PACKAGE_PIN F21 [get_ports resetn]
set_property IOSTANDARD LVCMOS33 [get_ports sdio_cd]
set_property IOSTANDARD LVCMOS33 [get_ports resetn]
set_property IOSTANDARD LVCMOS33 [get_ports qspi_dq_3]
