onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib vgaPixelClock_opt

do {wave.do}

view wave
view structure
view signals

do {vgaPixelClock.udo}

run -all

quit -force
