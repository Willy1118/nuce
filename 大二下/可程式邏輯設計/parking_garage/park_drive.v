`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:47 06/05/2024 
// Design Name: 
// Module Name:    park_drive 
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
module park_drive(clk_receive, rst, park_or_drive, A_full, B_full, C_full, moving_place);
    input clk_receive;
    input rst;
    input [1:0] park_or_drive; //0停車 1把A簽走 2把B牽走 3把C牽走
    output reg A_full; //A有沒有停車
    output reg B_full;
    output reg C_full;
    output reg [1:0] moving_place; //需要移動的車位
    
	 always @ (posedge clk_receive or posedge rst) begin
		if(rst) begin
			moving_place = 2'b00; //主角車位
			A_full = 0; 
			B_full = 0; 
			C_full = 0; 
		end
		else begin
		/*if(park_or_drive == 2'b00) begin //停車
			if(A_full == 1'b0) begin
				moving_place = 2'b01; //A車位
			end
			else if(B_full == 1'b0) begin
				moving_place = 2'b10; //B車位
			end
			else if(C_full == 1'b0) begin
				moving_place = 2'b11; //C車位
			end
			else begin
				moving_place = 2'b00; //none
			end
		end
		else begin //牽車
			if(park_or_drive == 2'b01)
				moving_place = 2'b01; 
			else if(park_or_drive == 2'b10)
				moving_place = 2'b10;
			else if(park_or_drive == 2'b11)
				moving_place = 2'b11; 
		end*/
	 end

endmodule
