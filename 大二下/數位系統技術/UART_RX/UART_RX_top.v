module UART_RX_top(i_clk, i_rst_b, i_RX_Bit, o_RX_Byte_b);

	input  i_clk, i_rst_b, i_RX_Bit;
	output [7:0] o_RX_Byte_b;
	
	wire rst = ~i_rst_b;
	wire clk_div;
	freq_div_n #(868, 10) m0 (i_clk, rst, clk_div);
	
	wire [7:0] r_RX_Byte;
	UART_RX m1 (clk_div, rst, i_RX_Bit, r_RX_Byte);
	assign o_RX_Byte_b = r_RX_Byte; 
	
endmodule 