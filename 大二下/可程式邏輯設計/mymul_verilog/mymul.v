`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:52 05/02/2024 
// Design Name: 
// Module Name:    mymul 
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
module mymul(x, y, p);
	 parameter N = 8; // this is the size of multiplier, modify it when necessary
    input [N-1:0] x;
    input [N-1:0] y;
    output [2*N-1:0] p;
    
	 assign p = x * y;

endmodule
