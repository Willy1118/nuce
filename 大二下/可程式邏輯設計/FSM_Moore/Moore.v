// Verilog test fixture created from schematic C:\ncue_logic_design\FSM_Moore\FSM_Moore.sch - Thu Apr 11 11:18:33 2024

`timescale 1ns / 1ps

module FSM_Moore_FSM_Moore_sch_tb();

// Inputs
   reg x;
   reg clk;

// Output
   wire Z;

// Bidirs

// Instantiate the UUT
   FSM_Moore UUT (
		.x(x), 
		.clk(clk), 
		.Z(Z)
   );
// Initialize Inputs
   initial begin
		clk = 0;
		forever #20 clk = ~clk;
   end
	initial begin
		x = 0;
		#102 x = 0;
		#40  x = 1;
		#40  x = 0;
		#40  x = 0;
		#40  x = 1;
		#40  x = 0;
		#40  x = 1;
		#40  x = 1;
		#40  x = 0;
		#40  x = 1;
		#40  x = 1;
		#40  x = 0;
		#40  x = 0;
		#40  x = 1;
		#40  x = 0;
		#40  x = 1;
		#40  x = 0;
		#40  x = 1;
		#40  x = 0;
		#40  x = 0;
		#40  x = 1;
		#40  x = 0;
		#40  x = 1;
   end
endmodule
