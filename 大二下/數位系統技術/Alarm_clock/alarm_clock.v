module alarm_clock(clk, rst, hr1, hr0, min1, min0, cnt3, cnt2, cnt1, cnt0, led_on);

	input clk, rst;
	
	input [1:0] hr1;
	input [3:0] hr0;
	input [2:0] min1;
	input [3:0] min0;
	
	output [3:0] cnt3, cnt2, cnt1, cnt0;
	output reg led_on;
	
	reg [3:0] dur_cnt;
	
	clock m0(clk, rst, cnt3, cnt2, cnt1, cnt0);
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			led_on = 1'b0;
		end
		else begin
			if (
				( (cnt3 == hr1) && (cnt2 == hr0) && (cnt1 == min1) && (cnt0 == min0-1'b1) ) ||
				( (cnt3 == hr1) && (cnt2 == hr0) && (cnt1 == min1-1'b1) && (cnt0 == 4'd9) && (min0 == 4'd0) ) ||
				( (cnt3 == hr1) && (cnt2 == hr0-1'b1) && (cnt1 == 4'd5) && (cnt0 == 4'd9) && (min1 == 3'd0) && (min0 == 4'd0) ) ||
				( (cnt3 == hr1-1'b1) && (cnt2 == 4'd9) && (cnt1 == 4'd5) && (cnt0 == 4'd9) && (hr0 == 4'd0) && (min1 == 3'd0) && (min0 == 4'd0) ) ||
				( (cnt3 == 4'd2) && (cnt2 == 4'd3) && (cnt1 == 4'd5) && (cnt0 == 4'd9) && (hr1 == 2'd0) && (hr0 == 4'd0) && (min1 == 3'd0) && (min0 == 4'd0) )
				) begin
					led_on = 1'b1;
					dur_cnt = 4'd0;
				end
			if(led_on == 1'b1) begin
				dur_cnt = dur_cnt + 1'b1;
				if(dur_cnt == 4'd11)
					led_on = 1'b0;
			end
		end
	end

endmodule 