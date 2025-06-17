`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:08:07 06/09/2024 
// Design Name: 
// Module Name:    response_system_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module response_system_top(clk, rst, button, current_number, counterA, counterB, counterC, counterD, counterE, number_service, counter_call,
A_serviceNumber, B_serviceNumber, C_serviceNumber, D_serviceNumber, E_serviceNumber);

	input clk, rst;
	input button; //抽號碼牌
	
	output [3:0] current_number; //現在號碼牌抽到幾號
	output counterA, counterB, counterC, counterD, counterE; //各個櫃檯的狀態(0閒置，1忙碌)
	output [5:0] number_service; //現在服務到幾號
	output [2:0] counter_call; //幾號櫃台在叫
	output [5:0] A_serviceNumber, B_serviceNumber, C_serviceNumber, D_serviceNumber, E_serviceNumber;
	wire [5:0] number_call; //叫號
	wire again;
	
	number      m1 (clk, rst, button, number_service, current_number, again);
	call_number m2 (clk, rst, current_number, number_service, counterA, counterB, counterC, counterD, counterE, again, counter_call, number_call);
	service     m3 (clk, rst, counter_call, number_call, counterA, counterB, counterC, counterD, counterE, 
						 A_serviceNumber, B_serviceNumber, C_serviceNumber, D_serviceNumber, E_serviceNumber, number_service);
 
endmodule
