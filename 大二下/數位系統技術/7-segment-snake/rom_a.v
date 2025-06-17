module rom_a(addr, data, dpt);

	input [4:0] addr;
	output reg [6:0] data;
	output dpt;
	
	always @(addr) begin
		
		case(addr)
		
			5'd0:  data = 7'b1111110;
			5'd6:  data = 7'b0111111;
			5'd7:  data = 7'b0101111;
			5'd8:  data = 7'b0100111;
			5'd9:  data = 7'b1100111;
			5'd10: data = 7'b1110111;
			5'd16: data = 7'b0111111;
			5'd17: data = 7'b0011111;
			5'd18: data = 7'b0011110;
			5'd19: data = 7'b1011110;
			
			default: data = 7'b1111111;
			
		endcase
	
	end
	
	assign dpt = 1'b1;

endmodule 