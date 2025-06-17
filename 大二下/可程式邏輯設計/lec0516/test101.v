`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:56:38 05/23/2024
// Design Name:   det101
// Module Name:   C:/ncue_logic_design/lec0516/test101.v
// Project Name:  lec0516
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

module test101;

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
		clk = 0;
		forever #20 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		x = 0;

		// Wait 100 ns for global reset to finish
		#105 x=1;
		#40  x=0;
		#40  x=1;
		#40  x=0;
		#40  x=0;
		#40  x=1;
		#40  x=1;
		#40  x=0;
		#40  x=1;
		#40  x=0;
		#40  x=1;
        
		// Add stimulus here

	end
      
endmodule

