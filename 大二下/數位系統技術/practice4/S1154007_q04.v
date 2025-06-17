module S1154007_q04(clk, rst, sw, seg0);

	input clk, rst;
	input [1:0] sw;
	output reg [6:0] seg0;
	
	wire clk_vfast, clk_fast, clk_slow;
	freq_div #(24) f1(clk, ~rst, clk_vfast);
	freq_div #(25) f2(clk, ~rst, clk_fast);
	freq_div #(26) f3(clk, ~rst, clk_slow);
	
	wire clk_cnt;
	assign clk_cnt = (sw == 2'b00) ? clk_slow :
						  (sw == 2'b10) ? clk_fast  : clk_vfast;
	
	reg [3:0] times, count;
	
	always @ (posedge clk_cnt or posedge ~rst) begin
		if(~rst) begin
			times = 4'b0001;
			count = 4'b0000;
		end
		else begin
			case(count)
				4'b0000 : {seg0} = {7'b1000000}; //0
				4'b0001 : {seg0} = {7'b1111001}; //1
				4'b0010 : {seg0} = {7'b0100100}; //2
				4'b0011 : {seg0} = {7'b0110000}; //3
				4'b0100 : {seg0} = {7'b0011001}; //4
				4'b0101 : {seg0} = {7'b0010010}; //5
				4'b0110 : {seg0} = {7'b0000010}; //6
				4'b0111 : {seg0} = {7'b1111000}; //7
				4'b1000 : {seg0} = {7'b0000000}; //8
				4'b1001 : {seg0} = {7'b0010000}; //9
			endcase
			
			count = count + 1;
			if(count > times) begin 
				count = 4'b0000;
				times = times + 4'b0001;
			end
			if(times == 4'b1010) times = 4'b0001;
			
		end
		
		
	end
	
	/*wire dpt;
	num_to_seg7(count, seg0, dpt);*/
	
endmodule 