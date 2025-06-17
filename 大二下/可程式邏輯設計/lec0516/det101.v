`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:13 05/23/2024 
// Design Name: 
// Module Name:    det101 
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
module det101(x, clk, Z);
    input x;
    input clk;
    output Z;
    wire A, B, xb, Bb, p1, p2, Da;

	 mydff da(Da, clk, A);
	 mydff db(x, clk, B);
	 not n1(xb, x);
	 not n2(Bb, B);
	 and a1(Z, A, B);
	 and a2(p1, xb, B);
	 and a3(p2, x, A, Bb);
	 or(Da, p1, p2);

endmodule
