`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:39:06 05/16/2024
// Design Name:   det101
// Module Name:   C:/ncue_logic_design/det101_verilog/test.v
// Project Name:  det101_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: det101
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
	reg x;
	reg clk;

	// Outputs
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	det101 uut (
		.x(x), 
		.clk(clk), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		
		clk = 0;
		
		forever #20 clk = ~clk;
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
	
	initial begin
		x = 0;
		
		#105 x = 0;
		#40 x = 1;
		#40 x = 0;
		#40 x = 1;
		#40 x = 1;
		#40 x = 1;
		#40 x = 0;
		#40 x = 0;
		#40 x = 1;
		#40 x = 0;
		#40 x = 1;
		#40 x = 0;
		#40 x = 1;
		#40 x = 0;
		#40 x = 0;
		#40 x = 0;
		#40 x = 1;
	end
      
endmodule

