module final_practice3(clk, rst, kc_sel, kr_sel, scan_code,
key_buf_code, sum);

	input  clk, rst;
	input  [3:0] kc_sel;
	output [3:0] kr_sel;
	wire press;
	output [3:0] scan_code;
	
	output [23:0] key_buf_code; 
	output [20:0] sum;
	
	kr_scan    m1(clk, rst, kr_sel);
	keyboard   m2(kr_sel, kc_sel, press, scan_code);
	key_buffer m3(clk, rst, press, scan_code, key_buf_code, sum);

endmodule 