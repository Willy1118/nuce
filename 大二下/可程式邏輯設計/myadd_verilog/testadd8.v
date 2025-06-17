`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:54:11 05/02/2024
// Design Name:   myadd
// Module Name:   C:/ncue_logic_design/myadd_verilog/testadd8.v
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

module testadd8;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] sum;
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
		a = 255;
		b = 255;
		cin = 0;
		
		#20;
		a = 123;
		b = 246;
		cin = 0;
		
		#20;
		a = 99;
		b = 69;
		cin = 0;
		
		#20;
		a = 150;
		b = 44;
		cin = 0;
		
		#20;
		a = 255;
		b = 255;
		cin = 1;
		
		#20;
		a = 123;
		b = 246;
		cin = 1;
		
		#20;
		a = 14;
		b = 88;
		cin = 1;
		
		#20;
		a = 55;
		b = 77;
		cin = 1;
		
		#20;
		a = 99;
		b = 77;
		cin = 1;
        
		// Add stimulus here

	end
      
endmodule

