`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:21 05/02/2024 
// Design Name: 
// Module Name:    mymux2 
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
module mymux2(in0, in1, sel, Y);
    input in0;
    input in1;
    input sel;
    output Y;
    
	 assign Y = sel ? in1 : in0;

endmodule
