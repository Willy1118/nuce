// Verilog test fixture created from schematic C:\ncue_logic_design\project1\add_sub.sch - Thu Mar 28 09:08:41 2024

`timescale 1ns / 1ps

module add_sub_add_sub_sch_tb();

// Inputs
   reg [3:0] a;
   reg [3:0] b;
   reg M;

// Output
   wire [4:0] s;
   wire sign;

// Bidirs

// Instantiate the UUT
   add_sub UUT (
		.a(a), 
		.b(b), 
		.s(s), 
		.M(M), 
		.sign(sign)
   );
// Initialize Inputs
  initial begin
		#20 a = 0; b = 15; M = 0;
		#20 a = 15; b = 0; M = 1;
		#20 a = 0; b = 15; M = 1;
		#20 a = 15; b = 0; M = 0;
		#20 a = 6; b = 9; M = 0;
		#20 a = 9; b = 6; M = 1;
		#20 a = 6; b = 9; M = 1;
		#20 a = 9; b = 6; M = 0;
		#20 a = 11; b = 12; M = 0;
		#20 a = 12; b = 11; M = 1;
		#20 a = 11; b = 12; M = 1;
		#20 a = 12; b = 11; M = 0;
		#20 a = 5; b = 7; M = 0;
		#20 a = 7; b = 5; M = 1;
		#20 a = 5; b = 7; M = 1;
		#20 a = 7; b = 5; M = 0;
		#20 a = 1; b = 1; M = 0;
		#20 a = 1; b = 1; M = 1;
   end
endmodule
