module cnt_00_59_bcd(clk, rst, carry_out, cnt1, cnt0);

	input clk, rst;
	output carry_out;
	output reg [3:0] cnt1, cnt0;
	
	assign carry_out = ({cnt1, cnt0} == {4'd5, 4'd9}) ? 1'b1 : 1'b0;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			{cnt1, cnt0} = {4'd0, 4'd0};
		end
		else begin
			if({cnt1, cnt0} == {4'd5, 4'd9})
				{cnt1, cnt0} = {4'd0, 4'd0};
			else if (cnt0 == 4'd9)
				{cnt1, cnt0} = {cnt1 + 1'b1, 4'd0};
			else
				cnt0 = cnt0 + 1;
		end
	end

endmodule 