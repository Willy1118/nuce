`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:23:53 05/30/2024 
// Design Name: 
// Module Name:    myinv 
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
module myinv(in, out);
    input in;
    output out;
    supply1 vdd;
	 supply0 gnd;
	 
	 pmos p1 (out, vdd, in); // pin order: drain, source, gate
	 nmos n1 (out, gnd, in); // pin order: drain, source, gate

endmodule
