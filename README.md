# Sau Mau Ping SoC revision 1 (Codename: 秀茂坪芯片一号)
This is the project of our SoC project we're already preparing in order to be ready
for a small enough structure size in #LibreSilicon

If you just wanna have some design with unfree Xilinx-IP stuff and some IPs from SiFive run

make MODEL=SauMauPingMIA702 CONFIG=SauMauPingMIA702Config

If you wanna have the fully free version, run:

make MODEL=SauMauPingASIC CONFIG=SauMauPingASICConfig

For the ASIC, we're still working on a DRAM controller so that we don't need the IP cores from Xilinx anymore

