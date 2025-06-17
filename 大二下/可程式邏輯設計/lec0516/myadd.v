`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:03 05/16/2024 
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
module myadd(x, y, cin, sum, cout);

	 parameter N = 8; // this is the size of the adder, modify it when necessary;
    input  [N-1:0] x;
    input  [N-1:0] y;
    input  cin;
    output [N-1:0] sum;
    output cout;
    
	 wire [N:0] carry; // the size of the carry vector is N+1(beginning and tailing)
	 
	 assign carry[0] = cin;
	 genvar i; // this is the generate variable for the index
	 generate
		for(i=0 ; i<N ; i=i+1) begin : uF
			fa fi(x[i], y[i], carry[i], sum[i], carry[i+1]);
		end
	 endgenerate
	 assign cout = carry[N];
	 
	 /*fa f0(x[0], y[0], cin, sum[0], c1);
	 fa f1(x[1], y[1], c1,  sum[1], c2);
	 fa f2(x[2], y[2], c2,  sum[2], c3);
	 fa f3(x[3], y[3], c3,  sum[3], cout);*/

endmodule
