`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:42 05/09/2024 
// Design Name: 
// Module Name:    myaddsub 
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
module myaddsub(A, B, M, S, sign);
    input [3:0] A;
    input [3:0] B;
    input M;
    output reg [4:0] S;
    output reg sign;
    
	 always @(A, B, M) begin
		if(M == 0) begin // do A+B
			S = A + B;
			sign = 0;
		end
		else begin // do A-B
			if(A<B) begin // A is smaller than B
				S = B - A;
				sign = 1;
			end
			else begin // A is bigger than B, or equal to B
				S = A - B;
				sign = 0;
			end
		end
	 end
endmodule
