module red_green(clk_light_cnt, rst, red_cnt, green_cnt, mode);

	parameter GREEN_TIME = 4'd9;
	parameter RED_TIME = 4'd5;
	
	input clk_light_cnt, rst;
	output reg [3:0] red_cnt, green_cnt;
	output reg mode;
	
	always @(posedge clk_light_cnt or posedge rst) begin
		if(rst) begin
			mode = 1'b0;
			green_cnt = GREEN_TIME;
			red_cnt = 4'd0;
		end
		else begin
			if(mode == 1'b0) begin
				green_cnt = green_cnt - 1'b1;
				if(green_cnt == 4'b0000) begin
					mode = 1'b1;
					red_cnt = RED_TIME;
				end
			end
			else if(mode == 1'b1) begin
				red_cnt = red_cnt - 1'b1;
				if(red_cnt == 4'b0000) begin
					mode = 1'b0;
					green_cnt = GREEN_TIME;
				end
			end
		end
	end

endmodule 