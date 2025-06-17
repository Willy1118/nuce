module addmux_4(a, b, sel, cout, y);

	input [3:0] a, b;
	input [1:0] sel;
	output cout;
	output [3:0] y;
	wire [3:0] w0;
	wire [3:0] sum;
	
	addsub_4 a0(a, b, sel[0], cout, sum);

	assign w0 = (sel[0] == 0)? a : b;
	assign y = (sel[1] == 0)? w0 : sum;
	assign cout = cout & sel[1];

endmodule 