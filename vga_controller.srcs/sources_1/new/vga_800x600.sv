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
// Description: A demo program to display a static image with 2^8 (256) colors.
//          Used to test the functionality of the vga_sync_gen module.
// 
// Dependencies: A pixel clock for the specified resolution is required for the
//          modules to work.
// 
// Revision: 1.00
// Revision 1.00 - File Completed
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module vga_800x600(
    output reg [7:0] pixel,
    output hsync,
    output vsync,
    input vgaClk
    );
    
    wire inDisplayArea;
    wire [9:0] counterX;
    
    vga_sync_gen hvsync0(
        .hsync(hsync),
        .vsync(vsync),
        .inDisplayArea(inDisplayArea),
        .counterX(counterX),
        .counterY(),
        .dispClk(vgaClk),
        .rst(1'b1)
    );
    
    always_ff @ (posedge vgaClk) begin
        if (inDisplayArea)
            pixel <= counterX[9:2];
        else
            pixel <= 8'h00;
    end
    
endmodule
