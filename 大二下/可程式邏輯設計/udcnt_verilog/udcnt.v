`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:30 05/09/2024 
// Design Name: 
// Module Name:    udcnt 
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
module udcnt(clk, ud, q);
    parameter N=4;
    input clk;
    input ud;
    output reg [N-1:0] q;
	 
	 initial q = 0;
    
	 always @(negedge clk) begin
		if(ud == 0)
			q = q + 1;
		else
			q = q - 1;
	 end

endmodule
