set_property SRC_FILE_INFO {cfile:u:/Users/hawkejo/Documents/Git/vga_controller/vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.xdc rfile:../../../vga_controller.srcs/sources_1/ip/vga_pixel_clock/vga_pixel_clock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk100MHz]] 0.1
