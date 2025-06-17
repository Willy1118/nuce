module bright_led(count, led_light);

	input [3:0] count;
	output reg [9:4] led_light;
	
	always @(count)
		case(count)			      
			4'b1001:{led_light} = {6'b100000}; 
			4'b1000:{led_light} = {6'b010000}; 
			4'b0111:{led_light} = {6'b001000}; 
			4'b0110:{led_light} = {6'b000100}; 
			4'b0101:{led_light} = {6'b000010}; 
			4'b0100:{led_light} = {6'b000001}; 
			
			default:{led_light} = {6'b000000};
		endcase

endmodule 