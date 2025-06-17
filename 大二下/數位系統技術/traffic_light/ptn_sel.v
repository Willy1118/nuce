module ptn_sel(clk, rst, mode, col_ptn, col_ptn2, col_ptn3, col);

	input clk, rst;
	input mode;
	input [15:0] col_ptn, col_ptn2, col_ptn3;
	output reg [15:0] col;
	
	reg [7:0] ptn_cnt;
	reg ptn_flag;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			ptn_cnt = 8'b0;
			ptn_flag = 1'b0;
			col = col_ptn;
		end
		else begin
			if(mode == 1'b0) begin
				ptn_cnt = ptn_cnt + 1'b1;
				if(ptn_cnt == 8'b0)
					ptn_flag = ~ptn_flag;
				col = (ptn_flag == 1'b0)? col_ptn : col_ptn2;
			end
			else if(mode == 1'b1) 
				col = col_ptn3;
		end
	end

endmodule 