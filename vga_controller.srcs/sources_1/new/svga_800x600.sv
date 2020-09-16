`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hawkeye Computer Systems
// Engineer: Joseph Hawker
// 
// Create Date: 07/11/2020 08:04:54 AM
// Design Name: vga_controller
// Module Name: svga_800x600
// Target Devices: Any FPGA with a VGA output and adequate clock.
// Tool Versions: Vivado 2020.1
// Description: A driver to generate the hsync and vsync signals and address
//              individual pixels for the VGA interface per the VESA spec.
//              
//              This module implements the SVGA resolution (800x600@60Hz).
// 
// Dependencies: A pixel clock for the specified resolution is required for the
//          modules to work.
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module svga_800x600(
    output reg [11:0] xCoord, yCoord,
    output hsync,
    output vsync,
    input vgaClk
    );
    
    /*
    * Super VGA (800 x 600)
    *
    * Pixel clock: 40.000 MHz
    *
    * Horizontal timings
    * Pixels:                      800
    * Front Porch:                  40
    * Sync Width:                  128
    * Back Porch:                   88
    * Total Pixels (Counter max): 1056 (800 + 40 + 128 + 88)
    *
    * Vertical timings
    * Pixels:                      600
    * Front Porch:                   1
    * Sync Width:                    4
    * Back Porch:                   23
    * Total Pixels (Counter max):  628 (600 + 1 + 4 + 23) 
    */
    parameter VGA_H_RES =  800;
    parameter VGA_H_FP  =   40;
    parameter VGA_H_SW  =  128;
    parameter VGA_H_BP  =   88;
    
    parameter VGA_V_RES =  600;
    parameter VGA_V_FP  =    1;
    parameter VGA_V_SW  =    4;
    parameter VGA_V_BP  =   23;
        
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
