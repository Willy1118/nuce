`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:36:02 05/09/2024
// Design Name:   udcnt
// Module Name:   C:/ncue_logic_design/udcnt_verilog/test.v
// Project Name:  udcnt_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: udcnt
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
	reg ud;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	udcnt uut (
		.clk(clk), 
		.ud(ud), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #20 clk = ~clk;
	end

	initial begin
		ud = 0;

		// Wait 100 ns for global reset to finish
		#115
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 1;
		#40
		ud = 1;
		#40
		ud = 1;
		#40
		ud = 1;
		#40
		ud = 1;
		#40
		ud = 0;
		#40
		ud = 0;
		#40
		ud = 0;
        
		// Add stimulus here

	end
      
endmodule

