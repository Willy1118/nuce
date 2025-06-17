`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:33 06/10/2024
// Design Name:   response_system_top
// Module Name:   C:/ncue_logic_design/response_system/test10.v
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

module test10;

	// Inputs
	reg clk;
	reg rst;
	reg button;

	// Outputs
	wire [3:0] current_number;
	wire counterA;
	wire counterB;
	wire counterC;
	wire counterD;
	wire counterE;
	wire [5:0] number_service;
	wire [2:0] counter_call;
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
		.current_number(current_number), 
		.counterA(counterA), 
		.counterB(counterB), 
		.counterC(counterC), 
		.counterD(counterD), 
		.counterE(counterE), 
		.number_service(number_service), 
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
		
		#157 button = 1;
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
		
		#17 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
		
		#17 button = 1;
		#3 button = 0;
		
		#157 button = 1;
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
		
		#17 button = 1;
		#3 button = 0;
	end
      
endmodule

