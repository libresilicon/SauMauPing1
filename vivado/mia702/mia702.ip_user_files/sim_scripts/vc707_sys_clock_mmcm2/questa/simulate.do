onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vc707_sys_clock_mmcm2_opt

do {wave.do}

view wave
view structure
view signals

do {vc707_sys_clock_mmcm2.udo}

run -all

quit -force
