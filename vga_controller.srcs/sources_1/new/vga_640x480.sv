`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hawkeye Computer Systems
// Engineer: Joseph Hawker
// 
// Create Date: 07/11/2020 08:04:54 AM
// Design Name: vga_controller
// Module Name: vga_640x480
// Target Devices: Any FPGA with a VGA output and adequate clock.
// Tool Versions: Vivado 2020.1
// Description: A driver to generate the hsync and vsync signals and address
//              individual pixels for the VGA interface per the VESA spec.
//              
//              This module implements the VGA resolution (640x480@60Hz).
// 
// Dependencies: A pixel clock for the specified resolution is required for the
//          modules to work.
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module vga_640x480(
    output reg [11:0] xCoord, yCoord,
    output hsync,
    output vsync,
    input vgaClk
    );
    
    /*
    * Standard VGA (640 x 480)
    *
    * Pixel clock: 25.175 MHz
    *
    * Horizontal timings
    * Pixels:                     640
    * Front Porch:                 16
    * Sync Width:                  96
    * Back Porch:                  48
    * Total Pixels (Counter max): 800 (640 + 16 + 96 + 48)
    *
    * Vertical timings
    * Lines:                      480
    * Front Porch:                 10
    * Sync Width:                   2
    * Back Porch:                  33
    * Total Lines (Counter max):  525 (480 + 10 + 2 + 33) 
    */
    parameter VGA_H_RES = 640;
    parameter VGA_H_FP  =  16;
    parameter VGA_H_SW  =  96;
    parameter VGA_H_BP  =  48;
    
    parameter VGA_V_RES = 480;
    parameter VGA_V_FP  =  10;
    parameter VGA_V_SW  =   2;
    parameter VGA_V_BP  =  33;
        
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
