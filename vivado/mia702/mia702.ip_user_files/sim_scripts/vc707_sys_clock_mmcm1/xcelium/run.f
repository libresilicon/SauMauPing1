-makelib xcelium_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../mia702.srcs/sources_1/ip/vc707_sys_clock_mmcm1/vc707_sys_clock_mmcm1_clk_wiz.v" \
  "../../../../mia702.srcs/sources_1/ip/vc707_sys_clock_mmcm1/vc707_sys_clock_mmcm1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

