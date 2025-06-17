// Verilog test fixture created from schematic C:\ncue_logic_design\FSM_Finite-State-Machine\FSM.sch - Thu Apr 11 10:28:43 2024

`timescale 1ns / 1ps

module FSM_FSM_sch_tb();

// Inputs
   reg clk;
   reg x;

// Output
   wire Z;

// Bidirs

// Instantiate the UUT
   FSM UUT (
		.clk(clk), 
		.x(x), 
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
