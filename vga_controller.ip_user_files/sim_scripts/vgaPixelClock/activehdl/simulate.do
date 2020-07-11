onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+vgaPixelClock -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.vgaPixelClock xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {vgaPixelClock.udo}

run -all

endsim

quit -force
