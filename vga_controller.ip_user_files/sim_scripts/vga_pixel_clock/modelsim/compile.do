vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr "+incdir+../../../ipstatic" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock_clk_wiz.v" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.v" \


vlog -work xil_defaultlib \
"glbl.v"

