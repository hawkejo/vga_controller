`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hawkeye Computer Systems
// Engineer: Joseph Hawker
// 
// Create Date: 07/11/2020 08:04:54 AM
// Design Name: vga_controller
// Module Name: sxga_1280x1024
// Target Devices: Any FPGA with a VGA output and adequate clock.
// Tool Versions: Vivado 2020.1
// Description: A driver to generate the hsync and vsync signals and address
//              individual pixels for the VGA interface per the VESA spec.
//              
//              This module implements the SXGA resolution (1280x1024@60Hz).
// 
// Dependencies: A pixel clock for the specified resolution is required for the
//          modules to work.
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module sxga_1280x1024(
    output reg [11:0] xCoord, yCoord,
    output hsync,
    output vsync,
    input vgaClk
    );
    
    /*
    * Super XGA (1280 x 1024)
    *
    * Pixel clock: 108.000 MHz +/- 0.5%
    *
    * Horizontal timings
    * Pixels:                     1280
    * Front Porch:                  48
    * Sync Width:                  112
    * Back Porch:                  248
    * Total Pixels (Counter max): 1688 (1280 + 48 + 112 + 248)
    *
    * Vertical timings
    * Lines:                      1024
    * Front Porch:                   1
    * Sync Width:                    3
    * Back Porch:                   38
    * Total Lines (Counter max):  1066 (1024 + 1 + 3 + 38) 
    */
    parameter VGA_H_RES = 1280;
    parameter VGA_H_FP  =   48;
    parameter VGA_H_SW  =  112;
    parameter VGA_H_BP  =  248;
    
    parameter VGA_V_RES = 1024;
    parameter VGA_V_FP  =    1;
    parameter VGA_V_SW  =    3;
    parameter VGA_V_BP  =   38;
        
    wire inDisplayArea;
    wire [11:0] counterX, counterY;
    
    vga_sync_gen 
        #(
            .VGA_H_RES(VGA_H_RES),
            .VGA_H_FP(VGA_H_FP),
            .VGA_H_SW(VGA_H_SW),
            .VGA_H_BP(VGA_H_BP),
            .VGA_V_RES(VGA_V_RES),
            .VGA_V_FP(VGA_V_FP),
            .VGA_V_SW(VGA_V_SW),
            .VGA_V_BP(VGA_V_BP)
        )
        hvsync0(
            .hsync(hsync),
            .vsync(vsync),
            .inDisplayArea(inDisplayArea),
            .counterX(counterX),
            .counterY(counterY),
            .dispClk(vgaClk),
            .rst(1'b1)
        );
    
    always_ff @ (posedge vgaClk) begin
        if (inDisplayArea) begin
            xCoord <= counterX;
            yCoord <= counterY;
        end
        else begin
            xCoord <= 12'h00;
            yCoord <= 12'h00;
        end
    end
    
endmodule
