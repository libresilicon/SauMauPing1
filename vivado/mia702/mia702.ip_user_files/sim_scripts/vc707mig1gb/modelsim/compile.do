vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_po_cntlr.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_byte_group_io.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_poc_tap_base.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_cntlr.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_prbs_rdlvl.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_4lanes.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_prbs_gen.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_dqs_found_cal.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_data.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_byte_lane.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_poc_edge_store.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_mc_phy_wrapper.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_wrcal.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_poc_cc.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_if_post_fifo.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_dqs_found_cal_hr.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_rdlvl.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_calib_top.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_edge.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_lim.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_skip_calib_tap.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_oclkdelay_cal.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_tempmon.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_top.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_samp.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_wrlvl.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_mc_phy.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_poc_top.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_init.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_poc_pd.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_ocd_mux.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_phy_wrlvl_off_delay.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_ddr_of_pre_fifo.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/phy/mig_7series_v4_1_poc_meta.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ip_top/mig_7series_v4_1_memc_ui_top_axi.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ip_top/mig_7series_v4_1_memc_ui_top_std.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ip_top/mig_7series_v4_1_mem_intfc.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ui/mig_7series_v4_1_ui_cmd.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ui/mig_7series_v4_1_ui_top.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ui/mig_7series_v4_1_ui_rd_data.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ui/mig_7series_v4_1_ui_wr_data.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/clocking/mig_7series_v4_1_infrastructure.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/clocking/mig_7series_v4_1_iodelay_ctrl.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/clocking/mig_7series_v4_1_tempmon.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/clocking/mig_7series_v4_1_clk_ibuf.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_round_robin_arb.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_arb_select.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_bank_common.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_bank_state.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_bank_compare.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_bank_queue.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_mc.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_rank_common.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_col_mach.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_arb_mux.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_rank_mach.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_rank_cntrl.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_arb_row_col.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_bank_mach.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/controller/mig_7series_v4_1_bank_cntrl.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_comparator.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_ctrl_write.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_r_upsizer.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_ctrl_addr_decode.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_axic_register_slice.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_ctrl_top.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_ctrl_reg.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_carry_latch_and.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_comparator_sel_static.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_carry_latch_or.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_carry_or.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_command_fifo.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_w_channel.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_axi_upsizer.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_cmd_arbiter.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_a_upsizer.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_simple_fifo.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_cmd_fsm.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_fifo.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_r_channel.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_b_channel.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_aw_channel.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_axi_register_slice.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_ctrl_reg_bank.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_incr_cmd.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_wrap_cmd.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_comparator_sel.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_ctrl_read.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_carry_and.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_ar_channel.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_ddr_w_upsizer.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_wr_cmd_fsm.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/axi/mig_7series_v4_1_axi_mc_cmd_translator.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ecc/mig_7series_v4_1_ecc_buf.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ecc/mig_7series_v4_1_ecc_dec_fix.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ecc/mig_7series_v4_1_ecc_merge_enc.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ecc/mig_7series_v4_1_fi_xor.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/ecc/mig_7series_v4_1_ecc_gen.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/vc707mig1gb_mig_sim.v" \
"../../../../mia702.srcs/sources_1/ip/vc707mig1gb/vc707mig1gb/user_design/rtl/vc707mig1gb.v" \

vlog -work xil_defaultlib \
"glbl.v"
