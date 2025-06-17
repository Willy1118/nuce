// Verilog test fixture created from schematic C:\ncue_logic_design\project2\project2_Moore.sch - Wed Apr 24 20:45:46 2024

`timescale 1ns / 1ps

module project2_Moore_project2_Moore_sch_tb();

// Inputs
   reg x;
   reg clk;

// Output
   wire Z;

// Bidirs

// Instantiate the UUT
   project2_Moore UUT (
		.x(x), 
		.clk(clk), 
		.Z(Z)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		x = 0;
		clk = 0;
   `endif
endmodule
