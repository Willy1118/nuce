`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:55 05/23/2024 
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
module mydff(d, clk, q);
    input d;
    input clk;
    output reg q;
    
	 initial q = 1'b0;
	
	 always @(negedge clk) begin
		q=d;
	 end

endmodule
