`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:30:37 05/02/2024 
// Design Name: 
// Module Name:    ha 
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
module ha(a, b, sum, carry);
    input a;
    input b;
    output sum;
    output carry;
    
	assign sum = a ^ b; // sum is a xor b
	assign carry = a & b; // carry out is a and b

endmodule 
