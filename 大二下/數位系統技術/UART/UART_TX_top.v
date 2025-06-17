module UART_TX_top(i_clk, i_rst_b, i_TX_Byte, o_TX_Byte_b, o_TX_Bit);

	input  i_clk, i_rst_b;
	input  [7:0] i_TX_Byte;
	output [7:0] o_TX_Byte_b;
	output o_TX_Bit;
	
	assign o_TX_Byte_b = i_TX_Byte;
	
	wire rst = ~i_rst_b;
	wire clk_div;
	freq_div_n #(868, 10) m0 (i_clk, rst, clk_div);
	
	wire r_TX_Bit;
	UART_TX m1 (clk_div, rst, i_TX_Byte, r_TX_Bit);
	assign o_TX_Bit = r_TX_Bit; 

endmodule 