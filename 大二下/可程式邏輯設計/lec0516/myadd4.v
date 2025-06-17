`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:32:14 05/16/2024
// Design Name:   myadd
// Module Name:   C:/ncue_logic_design/lec0516/myadd4.v
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

module myadd4;

	// Inputs
	reg [3:0] x;
	reg [3:0] y;
	reg cin;

	// Outputs
	wire [3:0] sum;
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
		#100;
      x = 15;
		y = 15;
		cin = 0;
		
		#30;
      x = 12;
		y = 9;
		cin = 0;
		
		#30;
      x = 7;
		y = 11;
		cin = 0;
		
		#30;
      x = 15;
		y = 15;
		cin = 1;
		
		#30;
      x = 5;
		y = 6;
		cin = 1;
		
		#30;
      x = 7;
		y = 11;
		cin = 1;
		
		#30;
      x = 14;
		y = 4;
		cin = 1;
		
		#30;
      x = 2;
		y = 9;
		cin = 1;
		
		#30;
      x = 13;
		y = 3;
		cin = 1;
		
		#30;
      x = 10;
		y = 14;
		cin = 1;
		// Add stimulus here

	end
      
endmodule

