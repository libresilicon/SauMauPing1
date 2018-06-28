set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_TCK]
           set_property -dict { PACKAGE_PIN R32  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TCK}]
           set_property -dict { PACKAGE_PIN W36  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TMS}]
           set_property -dict { PACKAGE_PIN W37  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TDI}]
           set_property -dict { PACKAGE_PIN V40  IOSTANDARD LVCMOS18  PULLUP TRUE } [get_ports {jtag_TDO}]
           create_clock -add -name JTCK        -period 100   -waveform {0 50} [get_ports {jtag_TCK}];