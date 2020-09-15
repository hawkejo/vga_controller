vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  "+incdir+../../../ipstatic" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock_clk_wiz.v" \
"../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.v" \


vlog -work xil_defaultlib \
"glbl.v"

