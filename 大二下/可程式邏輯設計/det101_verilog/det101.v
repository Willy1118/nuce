`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:00 05/16/2024 
// Design Name: 
// Module Name:    det101 
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
module det101(x, clk, Z);
    input x;
    input clk;
    output reg Z;
    
	 reg [1:0] state;
	 
	 initial state = 2'b00; // machine starts from s0
	 
	 always @(posedge clk) begin
		case(state)
			2'b00: begin //s0(state0)
						if(x == 0) begin
							state = 2'b00; // stay at s0
						end
						else begin
							state = 2'b01; // goto s1
						end
						Z = 1'b0; // S0 output is 0
					 end
			2'b01: begin //s1(state1)
						if(x == 0) begin
							state = 2'b10; // goto s2
						end
						else begin
							state = 2'b01; // stay at s1
						end
						Z = 1'b0; // S1 output is 0
					 end
			2'b10: begin //s2(state2)
						if(x == 0) begin
							state = 2'b00; // goto s0
						end
						else begin
							state = 2'b11; // goto s3
						end
						Z = 1'b0; // S2 output is 0
					 end
			2'b11: begin //s3(state3)
						if(x == 0) begin
							state = 2'b10; // goto s2
						end
						else begin
							state = 2'b01; // goto s1
						end
					   Z = 1'b1; // S3 output is 1
					 end
		endcase
	 end

endmodule
