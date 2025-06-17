`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:29:34 05/09/2024
// Design Name:   special_counter
// Module Name:   C:/ncue_logic_design/my_special_counter_verilog/test.v
// Project Name:  my_special_counter_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: special_counter
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
	reg clk;

	// Outputs
	wire [2:0] q;

	// Instantiate the Unit Under Test (UUT)
	special_counter uut (
		.clk(clk), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #20 clk = ~clk;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

