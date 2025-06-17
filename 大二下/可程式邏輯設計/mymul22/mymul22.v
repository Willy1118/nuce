// Verilog test fixture created from schematic C:\ncue_logic_design\mymul22\mymul22.sch - Thu Mar 14 11:33:19 2024

`timescale 1ns / 1ps

module mymul22_mymul22_sch_tb();

// Inputs
   reg [1:0] a;
   reg [1:0] b;

// Output
   wire [3:0] p;

// Bidirs

// Instantiate the UUT
   mymul22 UUT (
		.a(a), 
		.b(b), 
		.p(p)
   );
// Initialize Inputs
   initial begin
		  #20 a = 0; b = 0;
        #20 a = 2; b = 2;
        #20 a = 1; b = 3;
        #20 a = 2; b = 3;
		  #20 a = 2; b = 1;
   end
endmodule
