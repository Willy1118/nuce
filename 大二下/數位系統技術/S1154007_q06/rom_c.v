module rom_c(addr, data);

	input [3:0] addr;
	output reg [6:0] data;
	
	always @ (addr) begin
		case(addr)
			4'b0010 : data = 7'b1111110;
			4'b0011 : data = 7'b1111101;
			4'b0100 : data = 7'b1111011;
			4'b0101 : data = 7'b1110111;
			
			default data = 7'b1111111;
		endcase
	end
endmodule 