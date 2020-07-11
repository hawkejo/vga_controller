vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock_clk_wiz.v" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.v" \


vlog -work xil_defaultlib \
"glbl.v"

