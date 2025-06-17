module key_buffer(clk, rst, press, scan_code, sum);

	input  clk, rst, press;
	input  [3:0] scan_code;
	reg [5:0]  buf_flag_1, buf_flag_2;
	reg [23:0] key_buf_code_1, key_buf_code_2;
	reg [19:0] add_1, add_2;
	output reg [20:0] sum;
	
	reg cal_state;
	reg [3:0] decimal_num;
	integer i, j;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			buf_flag_1 = 6'b000000;
			key_buf_code_1 = 24'h000000;
			
			buf_flag_2 = 6'b000000;
			key_buf_code_2 = 24'h000000;
			
			add_1 = 20'd0;
			add_2 = 20'd0;
			sum = 21'd0;
			
			cal_state = 1'b0;
		end
		else 
			if(press == 1'b1) begin
				if(scan_code >= 4'h0 && scan_code <= 4'h9) begin
					if(cal_state == 1'b0) begin
						buf_flag_1 = {buf_flag_1[4:0], 1'b1};
						key_buf_code_1 = {key_buf_code_1[19:0], scan_code};
					end
					else begin
						buf_flag_2 = {buf_flag_2[4:0], 1'b1};
						key_buf_code_2 = {key_buf_code_2[19:0], scan_code};
					end
				end
				else if (scan_code == 4'hc) begin
					cal_state = 1'b1;
				end
				else if(scan_code == 4'hd) begin
					for(i=0 ; i<6 ; i=i+1) begin
						decimal_num = 4'd0;
						if(buf_flag_1[i] == 1'b1) begin
							for(j=0 ; j<4 ; j=j+1)
								decimal_num[j] = key_buf_code_1[i*4+j];
							add_1 = add_1 + decimal_num * (10**i);
						end
					end
					for(i=0 ; i<6 ; i=i+1) begin
						decimal_num = 4'd0;
						if(buf_flag_2[i] == 1'b1) begin
							for(j=0 ; j<4 ; j=j+1)
								decimal_num[j] = key_buf_code_2[i*4+j];
							add_2 = add_2 + decimal_num * (10**i);
						end
					end
					sum = add_1 + add_2;
				end
				else if(scan_code == 4'he) begin
					buf_flag_1 = 6'b000000;
					key_buf_code_1 = 24'h000000;
					
					buf_flag_2 = 6'b000000;
					key_buf_code_2 = 24'h000000;
					
					add_1 = 20'd0;
					add_2 = 20'd0;
					sum = 21'd0;
					
					cal_state = 1'b0;
				end
			end
	
	end

endmodule 