`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hawkeye Computer Systems
// Engineer: Joseph Hawker
// 
// Create Date: 07/11/2020 08:04:54 AM
// Design Name: vga_controller
// Module Name: vga_top
// Target Devices: Nexys 4 DDR
// Tool Versions: Vivado 2020.1
// Description: Top module for interfacing with a specific FPGA board, in this
//          case the Nexys 4 DDR.
// 
// Dependencies: 100 MHz Clock, Xilinx Clock Generation IP creating a 25.175 MHz
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module svga_top(
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output VGA_HS,
    output VGA_VS,
    input CLK100MHZ
    );
    
    wire dispClk;
    wire [2:0] videoSignal;
    
    vga_pixel_clock ip_clk_gen0(
        .vgaClk(dispClk),
        .resetn(1'b1),
        .clk100MHz(CLK100MHZ)
    );
    
    vga_800x600 driver0(
        .pixel(videoSignal),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .vgaClk(dispClk)
    );
    
    assign VGA_R = {4{videoSignal[0]}};
    assign VGA_G = {4{videoSignal[1]}};
    assign VGA_B = {4{videoSignal[2]}};
    
endmodule