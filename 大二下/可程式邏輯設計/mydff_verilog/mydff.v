`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:13 05/09/2024 
// Design Name: 
// Module Name:    mydff 
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
module mydff(clk, rst, d, q);
    input clk;
    input rst;
    input d;
    output q;
    reg q; // one register for q
	 
	 always @(posedge clk or posedge rst) begin
		if(rst) 
			q = 0; // reset the stored bit to 0
		else
			q = d; // output the stored bit by the input data
	 end

endmodule
