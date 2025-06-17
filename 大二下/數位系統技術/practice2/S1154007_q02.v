module S1154007_q02(clk, rst, sw, led4, led3, led2, led1);
	
	input clk, rst;
	input [1:0] sw;
	output reg led4, led3, led2, led1;
	wire clk_vfast, clk_fast, clk_slow;
	
	freq_div #(24) f1(clk, ~rst, clk_vfast);
	freq_div #(25) f2(clk, ~rst, clk_fast);
	freq_div #(26) f3(clk, ~rst, clk_slow);
	
	wire clk_cnt;
	assign clk_cnt = (sw == 2'b00) ? clk_slow :
						  (sw == 2'b10) ? clk_fast  : clk_vfast;
	
	wire [1:0] count;
	updn_count #(4) u1(clk_cnt, ~rst, 1, count);
	
	always@(count) begin
		case(count)
			2'b00 : {led4, led3, led2, led1} = {1'b0, 1'b0, 1'b0 ,1'b0};
			2'b01 : {led4, led3, led2, led1} = {1'b0, 1'b0, 1'b1 ,1'b1};
			2'b10 : {led4, led3, led2, led1} = {1'b1, 1'b0, 1'b0 ,1'b1};
			2'b11 : {led4, led3, led2, led1} = {1'b0, 1'b1, 1'b1 ,1'b0};
		endcase
	end

endmodule 