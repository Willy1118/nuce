`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:38 06/09/2024
// Design Name:   response_system_top
// Module Name:   C:/ncue_logic_design/response_system/test.v
// Project Name:  response_system
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: response_system_top
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
	reg button;

	// Outputs
	wire counterA;
	wire counterB;
	wire counterC;
	wire counterD;
	wire counterE;
	wire [5:0] max_call_number;
	wire [3:0] counter_call;
	wire [5:0] A_serviceNumber;
	wire [5:0] B_serviceNumber;
	wire [5:0] C_serviceNumber;
	wire [5:0] D_serviceNumber;
	wire [5:0] E_serviceNumber;

	// Instantiate the Unit Under Test (UUT)
	response_system_top uut (
		.clk(clk), 
		.rst(rst), 
		.button(button), 
		.counterA(counterA), 
		.counterB(counterB), 
		.counterC(counterC), 
		.counterD(counterD), 
		.counterE(counterE), 
		.max_call_number(max_call_number), 
		.counter_call(counter_call), 
		.A_serviceNumber(A_serviceNumber), 
		.B_serviceNumber(B_serviceNumber), 
		.C_serviceNumber(C_serviceNumber), 
		.D_serviceNumber(D_serviceNumber), 
		.E_serviceNumber(E_serviceNumber)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #10 clk = ~clk;
	end
	initial begin
		rst = 1;
		#10 rst = 0;
	end
	initial begin	
		button = 0;
		
		#29 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
	end
	
      
endmodule

