create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name \
 sys_clock_mmcm2 -dir $ipdir -force
set_property -dict [list \
 CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
 CONFIG.PRIM_SOURCE {No_buffer} \
 CONFIG.NUM_OUT_CLKS {1} \
 CONFIG.PRIM_IN_FREQ {125.0} \
 CONFIG.CLKIN1_JITTER_PS {50.0} \
 CONFIG.CLKOUT1_USED {true} \
 CONFIG.CLKOUT2_USED {false} \
 CONFIG.CLKOUT3_USED {false} \
 CONFIG.CLKOUT4_USED {false} \
 CONFIG.CLKOUT5_USED {false} \
 CONFIG.CLKOUT6_USED {false} \
 CONFIG.CLKOUT7_USED {false} \
 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {800.0} \
 CONFIG.CLKOUT1_REQUESTED_PHASE {0.0} \
 CONFIG.CLKOUT1_REQUESTED_DUTY_CYCLE {50.0} \
] [get_ips sys_clock_mmcm2]
