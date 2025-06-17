module ptn_sel(clk, rst, mode, col_ptn4, col_ptn5, col_ptn6, col_ptn7, col_ptn8, col_ptn9, col);

	input clk, rst;
	input [3:0] mode;
	input [15:0] col_ptn4, col_ptn5, col_ptn6, col_ptn7, col_ptn8, col_ptn9;
	output reg [15:0] col;
	
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			col = col_ptn9;
		end
		else begin
			if(mode == 4'b1001) col = col_ptn9;
			else if(mode == 4'b1000) col = col_ptn8;
			else if(mode == 4'b0111) col = col_ptn7;
			else if(mode == 4'b0110) col = col_ptn6;
			else if(mode == 4'b0101) col = col_ptn5;
			else if(mode == 4'b0100) col = col_ptn4;
		end
	end

endmodule 