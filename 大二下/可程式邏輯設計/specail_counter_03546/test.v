// Verilog test fixture created from schematic C:\ncue_logic_design\specail_counter_03546\special_counter.sch - Fri Apr 12 22:11:38 2024

`timescale 1ns / 1ps

module special_counter_special_counter_sch_tb();

// Inputs
   reg clk;

// Output
   wire [2:0] q;

// Bidirs

// Instantiate the UUT
   special_counter UUT (
		.q(q), 
		.clk(clk)
   );
// Initialize Inputs
   initial begin
		clk = 0;
		forever #50 clk = ~clk;
   end
endmodule
