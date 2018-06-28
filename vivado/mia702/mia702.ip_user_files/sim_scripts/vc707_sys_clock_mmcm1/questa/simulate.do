onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vc707_sys_clock_mmcm1_opt

do {wave.do}

view wave
view structure
view signals

do {vc707_sys_clock_mmcm1.udo}

run -all

quit -force
