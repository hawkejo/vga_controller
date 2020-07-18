`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Hawkeye Computer Systems
// Engineer: Joseph Hawker
// 
// Create Date: 07/11/2020 08:34:41 AM
// Design Name: vga_controller
// Module Name: vga_sync_gen
// Target Devices: Any FPGA with a VGA output and adequate clock.
// Tool Versions: Vivado 2020.1
// Description: A module designed to present the hsync and vsync signals for use
//          to connect to a VGA display. It also presents the x and y resolution
//          addresses for use in addressing individual pixels. Parameters are used
//          to allow for adjusting the design easily to work with other resolutions.
//
//          The Vivado Clocking Wizard in the IP Catalog is recommended to create
//          the specified frequency.
//
//          Source: https://ktln2.org/2018/01/23/implementing-vga-in-verilog/
// 
// Dependencies: Clock signal adequate for the display signal. Variable based on
//          specified resolution. Using default parameters for standard VGA, should
//          be 25.175 MHz (or close enough, spec provided by VESA is tolerant to a
//          degree).
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
// Additional Comments: Clock is dependant on desired resolution.
//////////////////////////////////////////////////////////////////////////////////


module vga_sync_gen(
    output wire hsync, vsync,
    output reg inDisplayArea,
    output reg [10:0] counterX,
    output reg [9:0] counterY, 
    input dispClk, // Needs to be 25.175 MHz for standard VGA, or close enough...
    input rst
    );
    
    /*
    * Standard VGA (640 x 480)
    *
    * Pixel clock: 25.175 MHz
    *
    * Horizontal timings
    * Pixels:                     800
    * Front Porch:                 40
    * Sync Width:                 128
    * Back Porch:                  88
    * Total Pixels (Counter max): 1056 (800 + 40 + 128 + 88)
    *
    * Vertical timings
    * Pixels:                     600
    * Front Porch:                  1
    * Sync Width:                   4
    * Back Porch:                  23
    * Total Pixels (Counter max): 628 (600 + 1 + 4 + 23) 
    */

    parameter VGA_H_RES = 800;
    parameter VGA_H_FP  =  40;
    parameter VGA_H_SW  = 128;
    parameter VGA_H_BP  =  88;
    
    parameter VGA_V_RES = 600;
    parameter VGA_V_FP  =   1;
    parameter VGA_V_SW  =   4;
    parameter VGA_V_BP  =  23;
    
    parameter VGA_H_PXL = VGA_H_RES + VGA_H_FP + VGA_H_SW + VGA_H_BP;
    parameter VGA_V_PXL = VGA_V_RES + VGA_V_FP + VGA_V_SW + VGA_V_BP;
    
    wire xMax, yMax;
    reg hsInv, vsInv;
    
    assign xMax = (counterX == VGA_H_PXL);
    assign yMax = (counterY == VGA_V_PXL);
    
    always_ff @ (posedge dispClk, negedge rst) begin
        if (~rst)
            counterX <= 0;
        else if (xMax)
            counterX <= 0;
        else
            counterX <= counterX + 1'b1;
    end

    // counterY only increments when counterX maxes out
    always_ff @ (posedge dispClk, negedge rst) begin
        if (~rst)
            counterY <= 0;
        else if (xMax) begin
            if (yMax)
                counterY <= 0;
            else
                counterY <= counterY + 1'b1;
        end
    end
    
    always_ff @ (posedge dispClk) begin
        hsInv <= (counterX >= (VGA_H_RES + VGA_H_FP)) && (counterX < (VGA_H_RES + VGA_H_FP + VGA_H_SW));
        vsInv <= (counterY >= (VGA_V_RES + VGA_V_FP)) && (counterY < (VGA_V_RES + VGA_V_FP + VGA_V_SW));
    end
    
    always_ff @(posedge dispClk) begin
        inDisplayArea <= (counterX < VGA_H_RES) && (counterY < VGA_V_RES);
    end
    
    assign hsync = ~hsInv;
    assign vsync = ~vsInv;
             
endmodule
