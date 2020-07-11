onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib vga_pixel_clock_opt

do {wave.do}

view wave
view structure
view signals

do {vga_pixel_clock.udo}

run -all

quit -force
