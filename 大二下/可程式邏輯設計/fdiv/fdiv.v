// Verilog test fixture created from schematic C:\ncue_logic_design\fdiv\fdiv.sch - Thu Mar 21 10:58:30 2024

`timescale 1ns / 1ps

module fdiv_fdiv_sch_tb();

// Inputs
   reg iclk;

// Output
   wire oclk;

// Bidirs

// Instantiate the UUT
   fdiv UUT (
		.iclk(iclk), 
		.oclk(oclk)
   );
// Initialize Inputs
   initial begin
		iclk = 0;
		forever #25 iclk = ~iclk;
   end
endmodule
