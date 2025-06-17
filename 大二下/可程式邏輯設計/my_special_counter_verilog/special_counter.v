`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:41 05/09/2024 
// Design Name: 
// Module Name:    special_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module special_counter(clk, q);
    input clk;
    output reg [2:0] q;
    
	 initial q = 0;
	 
	 always @(posedge clk) begin
		case(q)
			3'b000 : q = 3'b101;
			3'b101 : q = 3'b110;
			3'b110 : q = 3'b010;
			3'b010 : q = 3'b111;
			3'b111 : q = 3'b000;
			default q = 3'b000;
		endcase
	 end
	 
	 /*wire nQl, w1, nQ2;
	 
	 not n1 (nQ1, q[1]);
	 and a3 (w1, nW1, q[0]); 
	 not n2 (nQ2, q[2]);
	 and a1 (q[2], q[0], 1'b1);
	 and a2 (q[1], q[0], nQ1, q[2]);
	 or  o1 (q[0], w1, nQ2);*/
endmodule
