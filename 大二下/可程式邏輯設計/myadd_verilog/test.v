`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:37:42 05/02/2024
// Design Name:   myadd
// Module Name:   C:/ncue_logic_design/myadd_verilog/test.v
// Project Name:  myadd_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: myadd
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
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	myadd uut (
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
		a = 15;
		b = 15;
		cin = 0;
		
		#20;
		a = 7;
		b = 11;
		cin = 0;
		
		#20;
		a = 14;
		b = 9;
		cin = 0;
		
		#20;
		a = 2;
		b = 6;
		cin = 0;
		
		#20;
		a = 15;
		b = 15;
		cin = 1;
		
		#20;
		a = 5;
		b = 4;
		cin = 1;
		
		#20;
		a = 12;
		b = 13;
		cin = 1;
		
		#20;
		a = 1;
		b = 5;
		cin = 1;
		
		#20;
		a = 8;
		b = 13;
		cin = 1;
        
		// Add stimulus here

	end
      
endmodule

