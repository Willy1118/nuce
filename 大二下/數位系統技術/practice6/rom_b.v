module rom_b();

	input [2:0] addr;
	output reg [6:0] data;
	
	always @ (addr) begin
		case(addr)
			3'b000 : data = 7'b1011111;
			3'b001 : data = 7'b1101111;
			3'b010 : data = 7'b1110111;
			3'b011 : data = 7'b1111011;
			3'b100 : data = 7'b1111101;
			3'b101 : data = 7'b1111110;
		endcase
	end

endmodule 