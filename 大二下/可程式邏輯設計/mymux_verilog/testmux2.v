`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:18 05/02/2024
// Design Name:   mymux2
// Module Name:   C:/ncue_logic_design/mymux_verilog/testmux2.v
// Project Name:  mymux_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mymux2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmux2;

	// Inputs
	reg in0;
	reg in1;
	reg sel;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	mymux2 uut (
		.in0(in0), 
		.in1(in1), 
		.sel(sel), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		in0 = 0;

		// Wait 100 ns for global reset to finish
		forever #10 in0 = ~in0;        
		// Add stimulus here

	end
	
	initial begin
		// Initialize Inputs
		in1 = 0;

		// Wait 100 ns for global reset to finish
		forever #30 in1 = ~in1;        
		// Add stimulus here

	end
	
   initial begin
		// Initialize Inputs
		sel = 0;

		// Wait 105 ns for global reset to finish
		#105 sel = 0;
		#500 sel = 1;
		#600 sel = 0;
		
		// Add stimulus here

	end
endmodule

