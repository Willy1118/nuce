module S1154007_q05(clk, rst, seg2, seg1, seg0);

	input clk, rst;
	output reg [6:0] seg2, seg1, seg0;
	reg [3:0] count_2, count_1, count_0;
	
	wire clk_cnt;
	freq_div #(24) f1(clk, ~rst, clk_cnt);
	
	always @ (posedge clk_cnt or posedge ~rst) begin
		if(~rst) begin
			{seg2, seg1, seg0} = {7'b1000000, 7'b1000000, 7'b1000000};
			count_2 = 4'b0000;
			count_1 = 4'b0000;
			count_0 = 4'b0000;
		end
		else begin
			case(count_0)
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
			
			case(count_1)
				4'b0000 : {seg1} = {7'b1000000}; //0
				4'b0001 : {seg1} = {7'b1111001}; //1
				4'b0010 : {seg1} = {7'b0100100}; //2
				4'b0011 : {seg1} = {7'b0110000}; //3
				4'b0100 : {seg1} = {7'b0011001}; //4
				4'b0101 : {seg1} = {7'b0010010}; //5
				4'b0110 : {seg1} = {7'b0000010}; //6
				4'b0111 : {seg1} = {7'b1111000}; //7
				4'b1000 : {seg1} = {7'b0000000}; //8
				4'b1001 : {seg1} = {7'b0010000}; //9
			endcase
			
			case(count_2)
				4'b0000 : {seg2} = {7'b1000000}; //0
				4'b0001 : {seg2} = {7'b1111001}; //1
				4'b0010 : {seg2} = {7'b0100100}; //2
				4'b0011 : {seg2} = {7'b0110000}; //3
				4'b0100 : {seg2} = {7'b0011001}; //4
				4'b0101 : {seg2} = {7'b0010010}; //5
				4'b0110 : {seg2} = {7'b0000010}; //6
				4'b0111 : {seg2} = {7'b1111000}; //7
				4'b1000 : {seg2} = {7'b0000000}; //8
				4'b1001 : {seg2} = {7'b0010000}; //9
			endcase
			
			if(count_2 <= 4'b0101) begin
				if(count_0 <= 4'b0011) count_0 = count_0 + 4'b0001;
				else if(count_1 <= 4'b0100) count_1 = count_1 + 4'b0001;
				else if(count_2 <= 4'b0101) count_2 = count_2 + 4'b0001;
			end
			else begin
				if(count_0 < 4'b1001 && count_0 != 4'b0000) count_0 = count_0 + 4'b0001;
				else if(count_0 == 4'b1001) count_0 = 4'b0000;
				else if(count_1 < 4'b1001 && count_1 != 4'b0000) count_1 = count_1 + 4'b0001;
				else if(count_1 == 4'b1001) count_1 = 4'b0000;
				else if(count_2 < 4'b1001 && count_2 != 4'b0000) count_2 = count_2 + 4'b0001;
				else if(count_2 == 4'b1001) count_2 = 4'b0000;
			end
			
			
		end
	end

endmodule 