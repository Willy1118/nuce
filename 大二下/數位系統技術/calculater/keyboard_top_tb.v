`timescale 1ns/100ps

module keyboard_top_tb;
	parameter CLK_CYCLE = 10; // 10 ns

	reg clk, rst;
	reg [3:0] kc_sel;
	wire [3:0] kr_sel;
	
	wire press;
	wire [3:0] scan_code;
	
	wire [5:0] buf_flag_1;
	wire [23:0] key_buf_code_1;
	wire [5:0] buf_flag_2;
	wire [23:0] key_buf_code_2;
	
	wire [19:0] add_1, add_2;
	wire [20:0] sum;
	
	keyboard_top m1(clk, rst, kc_sel, kr_sel, 
					press, scan_code, 
					buf_flag_1, key_buf_code_1, 
					buf_flag_2, key_buf_code_2, 
					add_1, add_2, sum);

   	// clock generation
   	always begin
		clk = 0; #(CLK_CYCLE/2);
		clk = 1; #(CLK_CYCLE/2);
   	end
	
	//reset generation
	initial begin
		rst = 1'b1;
		kc_sel = 4'b0000;
		#10 rst = 1'b0;
	end

	// 
	initial begin
		#45 kc_sel = 4'b0111;
		#10 kc_sel = 4'b0000;
		#10 kc_sel = 4'b1110;
		#10 kc_sel = 4'b0000;
		#20 kc_sel = 4'b1011;
		#10 kc_sel = 4'b0000;
		#50 kc_sel = 4'b1110;
		#10 kc_sel = 4'b0000;
		#20 kc_sel = 4'b1101;
		#10 kc_sel = 4'b0000;
		#10 kc_sel = 4'b1011;
		#10 kc_sel = 4'b0000;
		#20 kc_sel = 4'b1101;
		#10 kc_sel = 4'b0000;
		#30 kc_sel = 4'b1011;
		#10 kc_sel = 4'b0000;
		#60 $finish;
	end

   	always @(posedge clk) begin
			$display("%d ns: press:%d, scan_code:%h, buf_flag_1:%b, key_buf_code_1:%h, buf_flag_2:%b, key_buf_code_2:%h, add_1:%6d, add_2:%6d, sum:%7d", $stime, press, scan_code,
			buf_flag_1, key_buf_code_1, 
			buf_flag_2, key_buf_code_2, 
			add_1, add_2, sum);
   	end
endmodule
