module S1154007_q03(clk, rst, seg3, seg2, seg1);
	input clk, rst;
	output reg [6:0] seg3, seg2, seg1;
	wire clk_cnt;
	freq_div #(24) f1(clk, ~rst, clk_cnt);
	wire [2:0] count;
	updn_count #(7) u1(clk_cnt, ~rst, 1, count);
	always@(count) begin
		case(count)
			3'b000 : {seg3, seg2, seg1} = {7'b1000000, 7'b1000000, 7'b1000000};
			3'b001 : {seg3, seg2, seg1} = {7'b0000000, 7'b0000000, 7'b0000000};
			3'b010 : {seg3, seg2, seg1} = {7'b0010010, 7'b0010010, 7'b0010010};
			3'b011 : {seg3, seg2, seg1} = {7'b1011000, 7'b1011000, 7'b1011000};
			3'b100 : {seg3, seg2, seg1} = {7'b0000000, 7'b0010010, 7'b0010010};
			3'b101 : {seg3, seg2, seg1} = {7'b0010010, 7'b1011000, 7'b1011000};
			3'b110 : {seg3, seg2, seg1} = {7'b1011000, 7'b0000000, 7'b0000000};
		endcase
	end
endmodule 