`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:35:01 05/09/2024
// Design Name:   mydff
// Module Name:   C:/ncue_logic_design/mydff_verilog/test.v
// Project Name:  mydff_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mydff
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
	reg rst;
	reg d;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	mydff uut (
		.clk(clk), 
		.rst(rst), 
		.d(d), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #20 clk = ~clk;
	end
	
	initial begin
		rst = 0;
		d = 0;
		// Wait 100 ns for global reset to finish
		#125;
		rst = 0;
		d = 1;
		
		#40;
		rst = 0;
		d = 1;
		
		#40;
		rst = 1;
		d = 1;
		
		#40;
		rst = 0;
		d = 1;
		
		#40;
		rst = 0;
		d = 0;
		
		#40;
		rst = 0;
		d = 1;
      
		// Add stimulus here
	end
	
      
endmodule

