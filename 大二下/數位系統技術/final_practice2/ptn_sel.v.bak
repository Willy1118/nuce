module ptn_sel(clk, rst, mode, col_ptn0, col_ptn1, col_ptn2, col_ptn3, col_ptn4, col_ptn5, col_ptn10, col);

	input clk, rst;
	input [5:0] mode;
	input [15:0] col_ptn0, col_ptn1, col_ptn2, col_ptn3, col_ptn4, col_ptn5, col_ptn10;
	output reg [15:0] col;
	
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			col = col_ptn10;
		end
		else begin
			if(mode == 6'b000001) col = col_ptn0;
			else if(mode == 6'b000010) col = col_ptn1;
			else if(mode == 6'b000100) col = col_ptn2;
			else if(mode == 6'b001000) col = col_ptn3;
			else if(mode == 6'b010000) col = col_ptn4;
			else if(mode == 6'b100000) col = col_ptn5;
			else col = col_ptn10;
		end
	end

endmodule 