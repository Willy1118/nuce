module clock(clk, rst, cnt3, cnt2, cnt1, cnt0);

	input clk, rst;
	output [3:0] cnt3, cnt2, cnt1, cnt0;
	
	wire carry0;
	
	cnt_00_23_bcd m0(clk, rst, carry0, cnt3, cnt2);
	cnt_00_59_bcd m1(clk, rst, carry0, cnt1, cnt0);

endmodule 