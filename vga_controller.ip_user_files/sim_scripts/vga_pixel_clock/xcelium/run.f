-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock_clk_wiz.v" \
  "../../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

