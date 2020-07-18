onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+vga_pixel_clock -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.vga_pixel_clock xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {vga_pixel_clock.udo}

run -all

endsim

quit -force
