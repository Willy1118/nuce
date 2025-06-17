`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:03 05/16/2024 
// Design Name: 
// Module Name:    fa 
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
module fa(a, b, cin, sum, cout);
    input a;
    input b;
    input cin;
    output sum;
    output cout;
    
	 /*wire t1, t2 ,t3;
	 
	 xor x1(sum, a, b, cin);
	 or  o1(cout, t1, t2, t3);
	 and a1(t1, a, b);
	 and a2(t2, b, cin);
	 and a3(t3, a, cin);*/
	 
	 wire c1, c2 ,temps;
	 
	 ha h1(a, b, temps, c1);
	 ha h2(temps, cin, sum, c2);
	 or o1(cout, c1, c2);

endmodule
