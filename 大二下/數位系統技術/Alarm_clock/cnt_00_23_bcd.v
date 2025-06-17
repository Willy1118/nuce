module cnt_00_23_bcd(clk, rst, en, cnt1, cnt0);

	input clk, rst, en;
	output reg [3:0] cnt1, cnt0;
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			{cnt1, cnt0} = {4'd0, 4'd0}; //00
		end
		else if(en == 1'b1) begin
			if({cnt1, cnt0} == {4'd2, 4'd3})
				{cnt1, cnt0} = {4'd0, 4'd0};
			else if(cnt0 == 4'd9)
				{cnt1, cnt0} = {cnt1+1'b1, 4'd0};
			else
				cnt0 = cnt0 + 1'b1;
		end
	end

endmodule 