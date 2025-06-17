module S1154007_q04(clk, sw, rst, seg3);
	input clk, rst;
	input [1:0] sw;
	output reg [6:0] seg3;
	
	wire clk_vfast, clk_fast, clk_slow;
	freq_div #(24) f1(clk, ~rst, clk_vfast);
	freq_div #(25) f2(clk, ~rst, clk_fast);
	freq_div #(26) f3(clk, ~rst, clk_slow);
	wire clk_cnt;
	assign clk_cnt = (sw == 2'b00) ? clk_slow :
						  (sw == 2'b10) ? clk_fast : clk_vfast;

	wire [3:0] count;
	updn_count #(10) u1(clk_cnt, ~rst, 1, count);
	always@(count) begin
		case(count)
			4'b0000 : {seg3} = {7'b1000000};
			4'b0001 : {seg3} = {7'b0000000};
			4'b0010 : {seg3} = {7'b1000000};
			4'b0011 : {seg3} = {7'b0010010};
			4'b0100 : {seg3} = {7'b1000000};
			4'b0101 : {seg3} = {7'b1011000};
			4'b0110 : {seg3} = {7'b1000000};
			4'b0111 : {seg3} = {7'b0000000};
			4'b1000 : {seg3} = {7'b0010010};
			4'b1001 : {seg3} = {7'b1011000};
		endcase
	end
endmodule