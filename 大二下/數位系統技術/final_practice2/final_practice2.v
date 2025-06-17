module final_practice2(clk, rst, J4, J7, J11, seg7_0, led);

	input clk, rst;
	output [8:1] J4, J7;
	output [8:1] J11;
	output [7:0] seg7_0;
	output [9:4] led;
	
	wire [15:0] col;
	wire [3:0] row_bin;
	
	assign J4[1] = ~col[15];
	assign J4[3] = ~col[14];
	assign J4[5] = ~col[13];
	assign J4[7] = ~col[12];
	assign J4[2] = ~col[11];
	assign J4[4] = ~col[10];
	assign J4[6] = ~col[9];
	assign J4[8] = ~col[8];
	
	assign J7[1] = ~col[7];
	assign J7[3] = ~col[6];
	assign J7[5] = ~col[5];
	assign J7[7] = ~col[4];
	assign J7[2] = ~col[3];
	assign J7[4] = ~col[2];
	assign J7[6] = ~col[1];
	assign J7[8] = ~col[0];
	
	assign J11[1] = row_bin[0];
	assign J11[3] = row_bin[1];
	assign J11[5] = row_bin[2];
	assign J11[7] = row_bin[3];
	
	wire clk2, clk3;
	wire [15:0] col_ptn4, col_ptn5, col_ptn6, col_ptn7, col_ptn8, col_ptn9;
	wire [3:0]  count;
	
	
	freq_div #(25) m0(clk, ~rst, clk2); // control the count
	freq_div #(16) m1(clk, ~rst, clk3); // control the matrix
	row_sel        m2(clk3, ~rst, row_bin);
	pattern4       m3(row_bin+4'd1, col_ptn4);
	pattern5       m4(row_bin+4'd1, col_ptn5);
	pattern6       m5(row_bin+4'd1, col_ptn6);
	pattern7       m6(row_bin+4'd1, col_ptn7);
	pattern8       m7(row_bin+4'd1, col_ptn8);
	pattern9       m8(row_bin+4'd1, col_ptn9);
	down_count     m9(clk2, ~rst, count);
	ptn_sel        m10(clk3, ~rst, count, col_ptn4, col_ptn5, col_ptn6, col_ptn7, col_ptn8, col_ptn9, col);
	
	wire [6:0] seg7_cnt;
	wire dpt_0;
	
	bright_led m11 (count, led);
	num_to_seg7_0_9 m12(count, seg7_cnt, dpt_cnt);
	
	assign seg7_0 = {dpt_cnt, seg7_cnt};

endmodule 