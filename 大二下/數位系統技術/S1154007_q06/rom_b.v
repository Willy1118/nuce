module rom_b(addr, data);

	input [3:0] addr;
	output reg [6:0] data;
	
	always @ (addr) begin
		case(addr)
			4'b0001 : data = 7'b1111110;
			4'b0110 : data = 7'b1110111;
			
			default data = 7'b1111111;
		endcase
	end
endmodule 