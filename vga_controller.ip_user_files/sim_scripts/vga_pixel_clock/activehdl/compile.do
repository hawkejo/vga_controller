vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock_clk_wiz.v" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.v" \


vlog -work xil_defaultlib \
"glbl.v"

