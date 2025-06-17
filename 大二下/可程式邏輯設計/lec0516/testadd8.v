`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:51:02 05/23/2024
// Design Name:   myadd
// Module Name:   C:/ncue_logic_design/lec0516/testadd8.v
// Project Name:  lec0516
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
	reg [7:0] x;
	reg [7:0] y;
	reg cin;

	// Outputs
	wire [7:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	myadd uut (
		.x(x), 
		.y(y), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#30
		x = 255;
		y = 255;
		cin = 0;
		
		#30
		x = 255;
		y = 255;
		cin = 0;
		
		#30
		x = 66;
		y = 99;
		cin = 0;
		
      #30
		x = 123;
		y = 246;
		cin = 0;
		
		#30
		x = 55;
		y = 77;
		cin = 0;
		
		#30
		x = 255;
		y = 255;
		cin = 1;
		
		#30
		x = 7;
		y = 11;
		cin = 1;
		
		#30
		x = 123;
		y = 246;
		cin = 1;
		
		#30
		x = 88;
		y = 22;
		cin = 1;
		
		#30
		x = 168;
		y = 66;
		cin = 1;
		
		#30
		x = 111;
		y = 44;
		cin = 1;
		// Add stimulus here

	end
      
endmodule

