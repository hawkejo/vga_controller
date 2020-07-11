-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Sat Jul 11 12:41:57 2020
-- Host        : HAWKEJO-LAPTOP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               u:/Users/hawkejo/Documents/Git/vga_controller/vga_controller.srcs/sources_1/ip/vgaPixelClock/vgaPixelClock_stub.vhdl
-- Design      : vgaPixelClock
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vgaPixelClock is
  Port ( 
    vgaClk : out STD_LOGIC;
    resetn : in STD_LOGIC;
    clk100MHz : in STD_LOGIC
  );

end vgaPixelClock;

architecture stub of vgaPixelClock is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "vgaClk,resetn,clk100MHz";
begin
end;
