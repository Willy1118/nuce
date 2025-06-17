module key_buffer(clk, rst, press, scan_code, key_buf_code, sum);

	input  clk, rst, press;
	input  [3:0] scan_code;
	output reg [23:0] key_buf_code;
	output reg [20:0] sum;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			key_buf_code = 24'h000000;
		end
		else 
			if(press == 1'b1) begin
				if(scan_code >= 4'h0 && scan_code <= 4'h9) begin
					key_buf_code = {key_buf_code[19:0], scan_code};
					sum = key_buf_code[3:0] + key_buf_code[7:4];
				end
			end
	
	end

endmodule 