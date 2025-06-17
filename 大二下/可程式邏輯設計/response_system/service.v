`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:22 06/09/2024 
// Design Name: 
// Module Name:    service 
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
module service(clk, rst, counter_call, number_call, counterA, counterB, counterC, counterD, counterE, 
A_serviceNumber, B_serviceNumber, C_serviceNumber, D_serviceNumber, E_serviceNumber, number_service);
    input clk;
    input rst;
    input [2:0] counter_call; //哪個櫃台叫號
    input [5:0] number_call;  //叫幾號
    output reg counterA, counterB, counterC, counterD, counterE; //A~E櫃檯的狀態(0空閒 1忙碌)
	 output reg [5:0] A_serviceNumber, B_serviceNumber, C_serviceNumber, D_serviceNumber, E_serviceNumber; //A~E櫃台服務的的號碼
	 output reg [5:0] number_service; //服務到幾號
    
	 reg [3:0] service_timeA, service_timeB, service_timeC, service_timeD, service_timeE; //A~E櫃台服務的時間
	 reg A_isService, B_isService, C_isService, D_isService, E_isService; //A~E櫃台是否正在服務(0空閒 1忙碌)
	 
	 always @ (posedge clk or posedge rst) begin
		if(rst) begin
			counterA = 1'b0;
			counterB = 1'b0;
			counterC = 1'b0;
			counterD = 1'b0;
			counterE = 1'b0;
			A_serviceNumber = 6'd0;
			B_serviceNumber = 6'd0;
			C_serviceNumber = 6'd0;
			D_serviceNumber = 6'd0;
			E_serviceNumber = 6'd0;
			service_timeA = 4'd0;
			service_timeB = 4'd0;
			service_timeC = 4'd0;
			service_timeD = 4'd0;
			service_timeE = 4'd0;
			A_isService = 1'b0;
			B_isService = 1'b0;
			C_isService = 1'b0;
			D_isService = 1'b0;
			E_isService = 1'b0;
			number_service = 6'd0;
		end
		else begin
			if(counter_call == 3'd1) begin //當叫號為A櫃台
				A_isService = 1'b1; //A為忙碌中
				counterA = 1'b1; //A為忙碌中
				A_serviceNumber = number_call; //A在服務哪個號碼
				number_service = A_serviceNumber; //服務到幾號(max)
			end
			if(counter_call == 3'd2) begin //當叫號為B櫃台
				B_isService = 1'b1; //B為忙碌中
				counterB = 1'b1; //B為忙碌中
				B_serviceNumber = number_call; //B在服務哪個號碼
				number_service = B_serviceNumber; //服務到幾號(max)
			end
			if(counter_call == 3'd3) begin //當叫號為C櫃台
				C_isService = 1'b1; //C為忙碌中
				counterC = 1'b1; //C為忙碌中
				C_serviceNumber = number_call; //C在服務哪個號碼
				number_service = C_serviceNumber; //服務到幾號(max)
			end
			if(counter_call == 3'd4) begin //當叫號為D櫃台
				D_isService = 1'b1; //D為忙碌中
				counterD = 1'b1; //D為忙碌中
				D_serviceNumber = number_call; //D在服務哪個號碼
				number_service = D_serviceNumber; //服務到幾號(max)
			end
			if(counter_call == 3'd5) begin //當叫號為E櫃台
				E_isService = 1'b1; //E為忙碌中
				counterE = 1'b1; //E為忙碌中
				E_serviceNumber = number_call; //E在服務哪個號碼
				number_service = E_serviceNumber; //服務到幾號(max)
			end
			
			if(A_isService == 1'b1) begin //當A櫃台服務時
				service_timeA = service_timeA + 1'b1; //A櫃台服務時間+1
				if(service_timeA == 4'd11)begin //當服務10clk
					service_timeA = 4'd0; //A櫃台服務時間歸零
					A_isService = 1'b0; //A櫃台空閒
					A_serviceNumber = 6'd0; //A櫃檯沒有服務人
					counterA = 1'b0; //A櫃台空閒
				end
			end
			if(B_isService == 1'b1) begin //當B櫃台服務時
				service_timeB = service_timeB + 1'b1; //B櫃台服務時間+1
				if(service_timeB == 4'd11)begin //當服務10clk
					service_timeB = 4'd0; //B櫃台服務時間歸零
					B_isService = 1'b0; //B櫃台空閒
					B_serviceNumber = 6'd0; //B櫃檯沒有服務人
					counterB = 1'b0; //B櫃台空閒
				end
			end
			if(C_isService == 1'b1) begin //當C櫃台服務時
				service_timeC = service_timeC + 1'b1; //C櫃台服務時間+1
				if(service_timeC == 4'd11)begin //當服務10clk
					service_timeC = 4'd0; //C櫃台服務時間歸零
					C_isService = 1'b0; //C櫃台空閒
					C_serviceNumber = 6'd0; //C櫃檯沒有服務人
					counterC = 1'b0; //C櫃台空閒
				end
			end
			if(D_isService == 1'b1) begin //當D櫃台服務時
				service_timeD = service_timeD + 1'b1; //D櫃台服務時間+1
				if(service_timeD == 4'd11)begin //當服務10clk
					service_timeD = 4'd0; //D櫃台服務時間歸零
					D_isService = 1'b0; //D櫃台空閒
					D_serviceNumber = 6'd0; //D櫃檯沒有服務人
					counterD = 1'b0; //D櫃台空閒
				end
			end
			if(E_isService == 1'b1) begin //當E櫃台服務時
				service_timeE = service_timeE + 1'b1; //E櫃台服務時間+1
				if(service_timeE == 4'd11)begin //當服務10clk
					service_timeE = 4'd0; //E櫃台服務時間歸零
					E_isService = 1'b0; //E櫃台空閒
					E_serviceNumber = 6'd0; //E櫃檯沒有服務人
					counterE = 1'b0; //E櫃台空閒
				end
			end
		end
	 end

endmodule
