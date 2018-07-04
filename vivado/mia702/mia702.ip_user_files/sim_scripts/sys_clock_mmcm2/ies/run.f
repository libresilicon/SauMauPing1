-makelib ies_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../mia702.srcs/sources_1/ip/sys_clock_mmcm2/sys_clock_mmcm2_clk_wiz.v" \
  "../../../../mia702.srcs/sources_1/ip/sys_clock_mmcm2/sys_clock_mmcm2.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

