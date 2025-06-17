module S1154007_q01(a, seg3, seg2);
	input [2:0] a;
	output reg [6:0] seg3, seg2;
	always@(a) begin
		case(a)
			3'b000 : {seg3, seg2} = {7'b0000000, 7'b0000000};
			3'b001 : {seg3, seg2} = {7'b0010010, 7'b0010010};
			3'b010 : {seg3, seg2} = {7'b1011000, 7'b1011000};
			3'b011 : {seg3, seg2} = {7'b0000000, 7'b0010010};
			3'b100 : {seg3, seg2} = {7'b0010010, 7'b1011000};
			3'b101 : {seg3, seg2} = {7'b1011000, 7'b0000000};
			default : {seg3, seg2} = {7'b1000000, 7'b1000000};
		endcase
	end
endmodule 