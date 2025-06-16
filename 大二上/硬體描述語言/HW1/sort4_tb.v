module sort2(A, B, minAB, maxAB);
	input  [7:0] A, B;
	output [7:0] minAB, maxAB;
	wire s;

	assign #2 s = (A<B) ? 1'b1 : 1'b0;
	assign #2 minAB = (s == 1) ? A : B;
	assign #2 maxAB = (s == 1) ? B : A;

endmodule

module sort4(x0, x1, x2, x3, y0, y1, y2, y3);
	
	input  [7:0] x0, x1, x2, x3;
	output [7:0] y0, y1, y2, y3;
	wire   [7:0] s1, s2, s3, s4, s5, s6, s7, s8;
	
	sort2 t1 (x0, x1, s1, s2);
	sort2 t2 (x2, x3, s3, s4);
	sort2 t3 (s1, s4, s5, s6);
	sort2 t4 (s2, s3, s7, s8);
	sort2 t5 (s5, s7, y0, y1);
	sort2 t6 (s6, s8, y2, y3);

endmodule

module sort4_tb;
	
	reg  [7:0] x0, x1, x2, x3;
	wire [7:0] y0, y1, y2, y3;

	sort4 m0 (x0, x1, x2, x3, y0, y1, y2, y3);

	initial
		$monitor("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, \
					Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d",
					$time ,x0, x1, x2, x3, y0, y1, y2, y3);
		initial begin
			#10 x0 = 8'd34 ; x1 = 8'd9 ; x2 = 8'd12 ; x3 = 8'd27;
			#20 x0 = 8'd10 ; x1 = 8'd56 ; x2 = 8'd30 ; x3 = 8'd18;
			#20 x0 = 8'd67 ; x1 = 8'd46 ; x2 = 8'd55 ; x3 = 8'd20;
			#20 $finish;
		end

endmodule

