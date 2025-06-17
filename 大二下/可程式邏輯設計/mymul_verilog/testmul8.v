`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:22 05/02/2024
// Design Name:   mymul
// Module Name:   C:/ncue_logic_design/mymul_verilog/testmul8.v
// Project Name:  mymul_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mymul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmul8;

	// Inputs
	reg [7:0] x;
	reg [7:0] y;

	// Outputs
	wire [15:0] p;

	// Instantiate the Unit Under Test (UUT)
	mymul uut (
		.x(x), 
		.y(y), 
		.p(p)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;

		// Wait 100 ns for global reset to finish
		#100;
		x = 255;
		y = 255;
      
		#20;
		x = 7;
		y = 11;
        
		#20;
		x = 123;
		y = 246;
        
		#20;
		x = 55;
		y = 88;
        
		#20;
		x = 99;
		y = 66;
      
		#20;
		x = 77;
		y = 22;
      
		#20;
		x = 168;
		y = 195;

		// Add stimulus here

	end
      
endmodule

