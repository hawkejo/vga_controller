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


module vga_top(
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output VGA_HS,
    output VGA_VS,
    input CLK100MHZ
    );
    
    wire [11:0] xCoord;
    
    vga_clock_sel sel0(
        .hs(VGA_HS),
        .vs(VGA_VS),
        .xCoord(xCoord),
        .clk100MHz(CLK100MHZ)
    );
    
    assign VGA_R = {xCoord[9],  xCoord[6], xCoord[3], xCoord[0]};
    assign VGA_G = {xCoord[10], xCoord[7], xCoord[4], xCoord[1]};
    assign VGA_B = {xCoord[11], xCoord[8], xCoord[5], xCoord[2]};
    
endmodule
