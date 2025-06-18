// `timescale 1ns/10ps

module trapezoid (clk, reset, nt, xi, yi, busy, po, xo, yo);
input clk, reset, nt;
input [7:0] xi, yi;
output reg busy, po;
output reg [7:0] xo, yo;

reg [7:0] xul, yu, xur, xdl, yd, xdr; // to prevent overflow
reg [15:0] xl, xr; // additional 8 bits for multiplication

reg [1:0]  state; // 0: WAIT state, 1: INPUT state, 2: OUTPUT state
reg [1:0]  in_cnt; // number of input coordinates
reg [7:0]  x_idx, y_idx; // for each y_idx, find all possible x_idx
reg [15:0] mR, mL;
  
always@(posedge clk, posedge reset) begin
	if (reset == 1'b1) begin
		// reset state and in_cnt
		state=0;
		in_cnt = 0;
		
		// reset output signals
		busy = 0;
		po = 0;
		
		xo = 0;
		yo = 0;	
	end
	else begin
		// WAIT state
		if (state == 0) begin
			if (nt == 1) begin
				busy = 1;
				// the 1st coordinate
				// make all the 2's complement
				// coordinates positive
				xul=xi+8'h80;
				yu=yi+8'h80;

				// for the remaining three coordinates
				in_cnt=in_cnt+1'b1;
				// enter INPUT state		
				state=1;								
			end

			po=0;
		end
		// INPUT state	
		else if (state == 1) begin
			if (in_cnt == 1) begin
				// the 2nd coordinate
				xur=xi+8'h80;
				yu=yi+8'h80;
				in_cnt=in_cnt+1'b1;
			end
			else if (in_cnt == 2) begin
				// the 3rd coordinate
				xdl=xi+8'h80;
				yd=yi+8'h80;
				in_cnt=in_cnt+1'b1;
			end
			else if (in_cnt == 3) begin
				// the 4th coordinate
				xdr=xi+8'h80;
				yd=yi+8'h80;
				in_cnt=0;
				
				// enter OUTPUT state
				state=2;
				
				y_idx=yd;
				xr = xdr;
				x_idx = xdl;			
			end
		end
		// OUTPUT state
		else if (state == 2) begin
			po=1;
			
			xo = x_idx - 8'h80;
			yo = y_idx - 8'h80;
			
			if (x_idx==xur && y_idx==yu) begin
				state = 0;
				busy = 0;
			end
			
			if(x_idx + 1 > xr) begin
				y_idx = y_idx + 1;
				if(xul >= xdl) begin
					xl = xdl + (y_idx - yd) * (xul - xdl) / (yu - yd);
				end
				else begin
					xl = xul + (yu - y_idx) * (xdl - xul) / (yu - yd);
				end
				
				if(xur >= xdr) begin
					xr = xdr + (y_idx - yd) * (xur - xdr) / (yu - yd);
				end
				else begin
					xr = xur + (yu - y_idx) * (xdr - xur) / (yu - yd);
				end
					
				x_idx = xl;
			end
			else 
				x_idx = x_idx + 1;
			// your code here
			
			
			// output xo, yo
		
		end
	end
end
endmodule
