// `timescale 1ns/10ps

module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);
input clk, reset, nt;
input [2:0] xi, yi;
output reg busy, po;
output reg [2:0] xo, yo;

reg [2:0] x1, y1, x2, y2, x3, y3;
reg [2:0] xL, xR;
// the range of x from xL to xR

reg [1:0] state; // 0: WAIT state, 1: INPUT state, 2: OUTPUT state 
reg [2:0] in_cnt; // number of input coordinates
reg [2:0] x_idx, y_idx; // for each y_idx, find all possible x_idx
reg [7:0] temp; // additional bits for mul & div


always@(posedge clk or posedge reset) begin
	if (reset == 1) begin
		// reset state and in_cnt
		state=0;	
		in_cnt=0;
		
		// reset output signals
		busy=0;
		po=0;
		
		xo=0;
		yo=0;	
	end
	else begin
		// WAIT state
		if (state == 0) begin
			if (nt == 1) begin
				x1=xi;
				y1=yi;

				// for the remaining two coordinates
				in_cnt=in_cnt+1'b1;
				// enter INPUT state	
				state=1;							
			end

			po=0;
		end
		// INPUT stae
		else if (state == 1) begin
			if (in_cnt == 1) begin
				// the 2nd coordinate
				x2=xi;
				y2=yi;
				busy=1;
				in_cnt=in_cnt+1'b1;
			end
			else if (in_cnt == 2) begin
				// the 3rd coordinate
				x3=xi;
				y3=yi;
				in_cnt=in_cnt+1'b1;
			end
			else if (in_cnt==3) begin
				// enter OUTPUT state
				state=2;
				in_cnt=0;
							
				xL=x1;
				xR=x1;
				
				// start from (x1, y1)
				x_idx=x1;
				y_idx=y1;
			end			
		end
		// OUTPUT state
		// for each y_idx, find x_idx satisfying
		// xL <= x_idx <= xR
		else if (state == 2) begin
			po=1;
			if(x_idx == x3 && y_idx == y3) begin
				state = 0;
				busy = 0;
			end

			xo=x_idx;
			yo=y_idx;
			
			// vertex at right|>
			if(x1 < x2) begin
				if(x_idx+1 > xR) begin
					y_idx = y_idx + 1;
					if(y_idx < y2) begin
						temp = x1 + (x2-x1) * (y_idx - y1) / (y2 - y1);
						xR = temp;
					end
					if(y_idx == y2) begin
						xR = x2;
					end
					if(y_idx > y2) begin
						temp = x3 + (x2-x3) * (y3 - y_idx) / (y3 - y2);
						xR = temp;
					end
					x_idx = xL;
				end
				else 
					x_idx = x_idx + 1;
			end
			
			// vertex at right<|
			if(x1 > x2) begin
				if(x_idx+1 > xR) begin
					y_idx = y_idx + 1;
					if(y_idx < y2) begin
						temp = x2 + (x1-x2) * (y2 - y_idx) / (y2 - y1);
						xL = temp;
					end
					if(y_idx == y2) begin
						xL = x2;
					end
					if(y_idx > y2) begin
						temp = x2 + (x3-x2) * (y_idx - y2) / (y3 - y2);
						xL = temp;
					end
					x_idx = xL;
				end
				else 
					x_idx = x_idx + 1;
			end

		end 
	end
end
endmodule
