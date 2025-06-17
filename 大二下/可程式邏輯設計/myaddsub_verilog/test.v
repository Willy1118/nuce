`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:52:12 05/09/2024
// Design Name:   myaddsub
// Module Name:   C:/ncue_logic_design/myaddsub_verilog/test.v
// Project Name:  myaddsub_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: myaddsub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg M;

	// Outputs
	wire [4:0] S;
	wire sign;

	// Instantiate the Unit Under Test (UUT)
	myaddsub uut (
		.A(A), 
		.B(B), 
		.M(M), 
		.S(S), 
		.sign(sign)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		M = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A = 15;
		B = 15;
		M = 0;
		#100;
		A = 7;
		B = 11;
		M = 0;
		#100;
		A = 2;
		B = 13;
		M = 0;
		#100;
		A = 5;
		B = 9;
		M = 0;
		#100;
		A = 15;
		B = 12;
		M = 1;
		#100;
		A = 7;
		B = 11;
		M = 1;
		#100;
		A = 9;
		B = 15;
		M = 1;
		#100;
		A = 10;
		B = 5;
		M = 1;
		#100;
		A = 4;
		B = 13;
		M = 1;
        
		// Add stimulus here

	end
      
endmodule

