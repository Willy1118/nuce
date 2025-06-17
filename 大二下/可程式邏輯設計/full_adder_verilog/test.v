`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:54:53 05/02/2024
// Design Name:   fa
// Module Name:   C:/ncue_logic_design/full_adder_verilog/test.v
// Project Name:  full_adder_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fa
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
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fa uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 0;
		b = 0;
		cin = 1;
		
		#100;
		a = 0;
		b = 1;
		cin = 0;
      
		#100;
		a = 0;
		b = 1;
		cin = 1;
		
		#100;
		a = 1;
		b = 0;
		cin = 0;
		
		#100;
		a = 1;
		b = 0;
		cin = 1;
		
		#100;
		a = 1;
		b = 1;
		cin = 0;
		
		#100;
		a = 1;
		b = 1;
		cin = 1;
		// Add stimulus here

	end
      
endmodule

