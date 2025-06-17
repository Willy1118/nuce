module keyboard_top(clk, rst, kc_sel, kr_sel, press, scan_code,
buf_flag_1, key_buf_code_1, buf_flag_2, key_buf_code_2, add_1, add_2, sum);

	input  clk, rst;
	input  [3:0] kc_sel;
	output [3:0] kr_sel;
	output press;
	output [3:0] scan_code;
	
	output [5:0]  buf_flag_1, buf_flag_2;
	output [23:0] key_buf_code_1, key_buf_code_2; 
   output [19:0] add_1, add_2;
	output [20:0] sum;
	
	kr_scan    m1(clk, rst, kr_sel);
	keyboard   m2(kr_sel, kc_sel, press, scan_code);
	key_buffer m3(clk, rst, press, scan_code,
					  buf_flag_1, key_buf_code_1, 
					  buf_flag_2, key_buf_code_2, 
					  add_1, add_2, sum);
endmodule 