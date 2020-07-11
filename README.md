# vga_controller

Implements a basic VGA controller design running at the VGA resolution (600x480p60). The key module is the vga_sync_gen which produces the hsync and vsync signals. It also produces the addresses for addressing individual pixels.

The correct clock for the desired resolution must be provided to the vga_sync_gen which is provided by the vga_pixel_clock ip provided by the Vivado Clocking Wizard in this implementation.

Github support for vivado is added through the scripts produced by Ricardo Barbedo in this repository: https://github.com/barbedo/vivado-git

This design also uses board files sourced from Xilinx for use in Vivado. For more seamless integration, make sure they are installed as well.
