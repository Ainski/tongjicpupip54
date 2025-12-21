onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ram_8bit_opt

do {wave.do}

view wave
view structure
view signals

do {ram_8bit.udo}

run -all

quit -force
