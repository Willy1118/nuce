module S1154007_q06(clk, rst, seg4, seg3, seg2, seg1);
	input clk, rst;
	output [6:0] seg4, seg3, seg2, seg1;
	wire clk_fast, clk_slow;
	freq_div #(23) f0(clk, ~rst, clk_fast);
	freq_div #(24) f1(clk, ~rst, clk_slow);
	wire clk_1, clk_2;
	wire [2:0] count_1, count_2;
	updn_count #(10) u0 (clk_fast, ~rst, 1, count_1);
	updn_count #(10) u1 (clk_slow, ~rst, 1, count_2);
	reg now;
	reg [5:0] count_3;
	
	always @ (posedge clk_slow or posedge ~rst) begin
		if(~rst) begin
			now = 1'b0;
			count_3 = 5'b00000;
		end
		else begin
			if(count_3 < 5'b11110) begin
			count_3 = count_3 + 5'b00001;
		end
		if(count_3 == 5'b11110) begin
			now = ~now;
			count_3 = 5'b00000;
			end
		end
	end

	rom_a(seg4, count_1);
	rom_b(seg3, count_1);
	rom_c(seg2, count_1);
endmodule 