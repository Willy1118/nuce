`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:23 06/09/2024 
// Design Name: 
// Module Name:    number 
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
module number(clk, rst, button, number_service, current_number, again);
    input clk;
    input rst;
    input button;
	 input [5:0] number_service; //號碼牌 叫號
    output reg [3:0] current_number; //目前號碼牌抽到幾號
	 output reg again;
    
	 always @ (posedge clk or posedge rst) begin
		if(rst) begin
			current_number = 6'd0;
			again = 4'd0;
		end
		else begin
			if(button == 1'b1) //有人抽時
				current_number = current_number + 1'd1; //號碼牌加1
			if(current_number == 4'd15) begin
				current_number = 6'd1; //重新抽
				again = 1'b1;
			end
			if(number_service == 6'd1 && again == 1'b1) begin
				again = 1'b0;
			end
		end
	 end
endmodule
