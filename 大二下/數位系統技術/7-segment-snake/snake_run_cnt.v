module snake_run_cnt(clk, rst, updn, ptn_cnt, run_cnt, run_stop);

	parameter CNT_LENGTH = 8;
	
	input clk, rst, updn;
	input [4:0] ptn_cnt;
	output reg [3:0] run_cnt;
	output reg run_stop;
	
	reg [3:0] run_cnt_tmp;
	
	always @(posedge clk or posedge rst)
	begin
	
		if(rst)
		begin
			run_cnt = 4'd0;
			run_stop = 1'b0;
			run_cnt_tmp = 4'd1;
		end
		else
		begin
			if((updn == 1 && ptn_cnt == CNT_LENGTH-1) || (updn == 0 && ptn_cnt == 1))
				run_cnt_tmp = run_cnt_tmp + 1;
			if(run_cnt_tmp <= 4'd9) run_cnt = run_cnt_tmp;
			else run_stop = 1;
		end
	
	end

endmodule 