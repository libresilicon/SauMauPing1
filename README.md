# Sau Mau Ping SoC revision 1 (Codename: 秀茂坪芯片一号)
This is the project of our SoC project we're already preparing in order to be ready
for a small enough structure size in #LibreSilicon

You can generate the verilog code by running

make verilog

and an emulator (requires verilator version *3.904* !!) by running

make sim

The emulator will appear as vsim/emulator and can be executed by running

./vsim/emulator

For the ASIC, we're still working on a DRAM controller so that we don't need the IP cores from Xilinx anymore
