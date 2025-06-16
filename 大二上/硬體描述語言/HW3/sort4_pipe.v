module R(clk, rst, value, tmp_save);

	input clk, rst;
	input [7:0] value;
	output reg [7:0] tmp_save;

	always @ (posedge clk) begin
	
		if(rst) 
			#2 tmp_save <= 8'b0;
		else 
			#2 tmp_save <= value;
	
	end

endmodule

module sort2(A, B, minAB, maxAB);
	input [7:0] A, B;
	output [7:0] minAB, maxAB;
	wire s;

	assign #2 s = (A<B) ? 1'b1 : 1'b0;
	assign #2 minAB = (s == 1) ? A : B;
	assign #2 maxAB = (s == 1) ? B : A;
endmodule

module sort4_pipe(clk, rst, x0, x1, x2, x3, y0, y1, y2, y3);
	
	input clk, rst;
	input [7:0] x0, x1, x2, x3;
	output [7:0] y0, y1, y2, y3;
	wire [7:0] s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;
	wire [7:0] p [15:0];

	R reg1 (clk, rst, x0, p[0]);
	R reg2 (clk, rst, x1, p[1]);
	R reg3 (clk, rst, x2, p[2]);
	R reg4 (clk, rst, x3, p[3]);

	sort2 t1 (p[0], p[1], s1, s2);
	R reg5 (clk, rst, s1, p[4]);
	R reg6 (clk, rst, s2, p[5]);

	sort2 t2 (p[2], p[3], s3, s4);
	R reg7 (clk, rst, s3, p[6]);
	R reg8 (clk, rst, s4, p[7]);

	sort2 t3 (p[4], p[7], s5, s6);
	R reg9 (clk, rst, s5, p[8]);
	R reg10 (clk, rst, s6, p[9]);

	sort2 t4 (p[5], p[6], s7, s8);
	R reg11 (clk, rst, s7, p[10]);
	R reg12 (clk, rst, s8, p[11]);

	sort2 t5 (p[8], p[10], s9, s10);
	R reg13 (clk, rst, s9, p[12]);
	R reg14 (clk, rst, s10, p[13]);

	sort2 t6 (p[9], p[11], s11, s12);
	R reg15 (clk, rst, s11, p[14]);
	R reg16 (clk, rst, s12, p[15]);

	assign y0 = p[12];
	assign y1 = p[13];
	assign y2 = p[14];
	assign y3 = p[15];

endmodule

