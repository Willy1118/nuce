`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:42 05/02/2024 
// Design Name: 
// Module Name:    myadd 
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
module myadd(a, b, cin, sum, cout);
	 parameter N = 8; //this is the adder size, modify it when necessary
    input [N-1:0] a;
    input [N-1:0] b;
    input cin;
    output [N-1:0] sum;
    output cout;

	 assign {cout, sum} = a + b + cin; // combined 5 bit vector is the arithmetic sum of the 3 inputs

endmodule
