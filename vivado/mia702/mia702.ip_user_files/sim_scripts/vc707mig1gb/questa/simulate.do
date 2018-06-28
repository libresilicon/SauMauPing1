onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vc707mig1gb_opt

do {wave.do}

view wave
view structure
view signals

do {vc707mig1gb.udo}

run -all

quit -force
