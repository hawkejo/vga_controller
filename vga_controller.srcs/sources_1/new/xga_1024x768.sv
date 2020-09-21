`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hawkeye Computer Systems
// Engineer: Joseph Hawker
// 
// Create Date: 07/11/2020 08:04:54 AM
// Design Name: vga_controller
// Module Name: xga_1024x768
// Target Devices: Any FPGA with a VGA output and adequate clock.
// Tool Versions: Vivado 2020.1
// Description: A driver to generate the hsync and vsync signals and address
//              individual pixels for the VGA interface per the VESA spec.
//              
//              This module implements the XGA resolution (1024x768@60Hz).
// 
// Dependencies: A pixel clock for the specified resolution is required for the
//          modules to work.
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module xga_1024x768(
    output reg [11:0] xCoord, yCoord,
    output hsync,
    output vsync,
    input vgaClk
    );
    
    /*
    * Extended Graphics Array (1024 x 768)
    *
    * Pixel clock: 65.000 MHz +/- 0.5%
    *
    * Horizontal timings
    * Pixels:                     1024
    * Front Porch:                  24
    * Sync Width:                  136
    * Back Porch:                  160
    * Total Pixels (Counter max): 1344 (1024 + 24 + 136 + 160)
    *
    * Vertical timings
    * Lines:                       768
    * Front Porch:                   3
    * Sync Width:                    6
    * Back Porch:                   29
    * Total Lines (Counter max):   806 (768 + 3 + 6 + 29) 
    */
    parameter VGA_H_RES = 1024;
    parameter VGA_H_FP  =   24;
    parameter VGA_H_SW  =  136;
    parameter VGA_H_BP  =  160;
    
    parameter VGA_V_RES =  768;
    parameter VGA_V_FP  =    3;
    parameter VGA_V_SW  =    6;
    parameter VGA_V_BP  =   29;
        
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
