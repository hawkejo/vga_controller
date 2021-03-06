// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Jul 11 13:57:20 2020
// Host        : HAWKEJO-LAPTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top vga_pixel_clock -prefix
//               vga_pixel_clock_ vga_pixel_clock_stub.v
// Design      : vga_pixel_clock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module vga_pixel_clock(vgaClk, resetn, clk100MHz)
/* synthesis syn_black_box black_box_pad_pin="vgaClk,resetn,clk100MHz" */;
  output vgaClk;
  input resetn;
  input clk100MHz;
endmodule
