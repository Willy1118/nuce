module S1154007_q07(clk, rst, sw, seg3);
	input clk, rst;
	input [1:0] sw;
	output reg [6:0] seg3;
	wire clk_out;
	freq_div #(24) f1(clk, ~rst, clk_out);
	wire [3:0] num;
	assign num = (sw == 2'b00) ? 4'b1000 :
	                 (sw == 2'b01) ? 4'b0101 : 
						  (sw == 2'b10) ? 4'b0111 : num;
	wire count;
	updn_count #(2) u1(clk_out, ~rst, 1, count);
	reg [6:0]tmp;
	always@(count) begin
		if(num == 4'b1000) tmp = 7'b0000000;
		else if(num == 4'b0101) tmp = 7'b0010010;
		else if(num == 4'b0111) tmp = 7'b1011000;
		case(count)
		1'b0 : {seg3} = {7'b1000000};
		1'b1 : {seg3} = {tmp};
		endcase
	end
endmodule
