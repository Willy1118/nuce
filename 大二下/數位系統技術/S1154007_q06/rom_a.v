module rom_a(addr, data);

	input [3:0] addr;
	output reg [6:0] data;
	
	always @ (addr) begin
		case(addr)
			4'b0000 : data = 7'b1111110;
			4'b0111 : data = 7'b1110111;
			4'b1000 : data = 7'b1101111;
			4'b1001 : data = 7'b1011111;
			
			default data = 7'b1111111;
		endcase
	end
endmodule 