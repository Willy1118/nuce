module alarm_clock_top(clk, rst, hr1, hr0, min1, min0,
seg7_5, seg7_5_dpt, seg7_4, seg7_4_dpt,
seg7_3, seg7_3_dpt, seg7_2, seg7_2_dpt,
led);

	input clk, rst;
	input [1:0] hr1;
	input [2:0] hr0;
	input [1:0] min1;
	input [2:0] min0;
	
	output [6:0] seg7_5, seg7_4, seg7_3, seg7_2;
	output seg7_5_dpt, seg7_4_dpt, seg7_3_dpt, seg7_2_dpt;
	output led;
	
	wire [4:0] cnt3, cnt2, cnt1, cnt0;
	wire clk_clock;
	wire led;
	
	wire clk_fast, clk_slow;
	freq_div #(22) f1(clk, ~rst, clk_fast);
	freq_div #(25) f2(clk, ~rst, clk_slow);
	
	wire clk_cnt;
	assign clk_cnt = (led == 1'b1) ? clk_slow : clk_fast;
	
	alarm_clock m0 (clk_cnt, ~rst, hr1, hr0, min1, min0, cnt3, cnt2, cnt1, cnt0, led);
	
	num_to_seg7_0_9 m1(cnt3, seg7_5, seg7_5_dpt);
	num_to_seg7_0_9 m2(cnt2, seg7_4, seg7_4_dpt);
	num_to_seg7_0_9 m3(cnt1, seg7_3, seg7_3_dpt);
	num_to_seg7_0_9 m4(cnt0, seg7_2, seg7_2_dpt);

endmodule 