module row_sel(clk, rst, row_bin);

	input clk, rst;
   output reg [3:0] row_bin;
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			row_bin = 4'd0;
		else
			row_bin = row_bin + 4'd1;
	end

endmodule 