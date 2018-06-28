vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ipstatic" "+incdir+../../../ipstatic" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" "+incdir+../../../ipstatic" \
"../../../../mia702.srcs/sources_1/ip/vc707_sys_clock_mmcm2/vc707_sys_clock_mmcm2_clk_wiz.v" \
"../../../../mia702.srcs/sources_1/ip/vc707_sys_clock_mmcm2/vc707_sys_clock_mmcm2.v" \

vlog -work xil_defaultlib \
"glbl.v"

