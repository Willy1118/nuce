module sort2(A, B, minAB, maxAB);
	input [7:0] A, B;
	output [7:0] minAB, maxAB;
	wire s;

	assign #2 s = (A<B) ? 1'b1 : 1'b0;
	assign #2 minAB = (s == 1) ? A : B;
	assign #2 maxAB = (s == 1) ? B : A;
endmodule
