`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:56 06/09/2024 
// Design Name: 
// Module Name:    call_number 
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
module call_number(clk, rst, current_number, number_service, counterA, counterB, counterC, counterD, counterE, again, counter_call, number_call);

	input clk, rst;
	input [3:0] current_number;
	input [5:0] number_service; //號碼牌 叫號
	input counterA, counterB, counterC, counterD, counterE; //A~E櫃台狀態
	input again;
	output reg [2:0] counter_call; //哪個櫃台在叫
	output reg [5:0] number_call; //叫了幾號
	
	always @(*) begin
		if(rst) begin
			counter_call = 3'd0;
			number_call = 6'd0;
		end
		else begin
			if((again == 1'b1 || number_service < current_number) && (counterA + counterB + counterC + counterD + counterE != 3'd5) ) begin //當服務號碼小於目前號碼牌才能叫號
				if(counterA == 1'b0) begin //A櫃台空置
					counter_call = 3'd1; //A櫃台叫號
					number_call = number_service + 1'b1; //號碼加1
					
				end
				else if(counterB == 1'b0) begin //B櫃台空置
					counter_call = 3'd2; //B櫃台叫號
					number_call = number_service + 1'b1; //號碼加1
				end
				else if(counterC == 1'b0) begin //C櫃台空置
					counter_call = 3'd3; //C櫃台叫號
					number_call = number_service + 1'b1; //號碼加1
				end
				else if(counterD == 1'b0) begin //D櫃台空置
					counter_call = 3'd4; //D櫃台叫號
					number_call = number_service + 1'b1; //號碼加1
				end
				else if(counterE == 1'b0) begin //E櫃台空置
					counter_call = 3'd5; //E櫃台叫號
					number_call = number_service + 1'b1; //號碼加1
				end 
				if(number_call == 4'd15) number_call = 4'd1;
			end
			else begin
				counter_call = 3'd0;
			end
		end
	end

endmodule
