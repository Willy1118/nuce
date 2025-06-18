module SET(clk, rst, en, central, radius, mode, 
busy, valid, candidate );

input clk, rst, en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;

output busy;
output valid;
output [7:0] candidate;

reg busy;
reg valid;

reg [3:0] x, y;
// central (x,y) for the three circles
reg [3:0] xa, ya, xb, yb, xc, yc;
// radius for the three circles
reg [3:0] ra, rb, rc;

// xa_sqr = (x-xa)*(x-xa); ya_sqr = (y-ya)*(y-ya);
// xb_sqr = (x-xb)*(x-xb); yb_sqr = (y-yb)*(y-yb);
// xc_sqr = (x-xc)*(x-xc); yc_sqr = (y-yc)*(y-yc);
reg [7:0] xa_sqr, ya_sqr, xb_sqr, yb_sqr, xc_sqr, yc_sqr;

// the number of candidate points
reg [7:0] cnt;
// three states: INPUT, OUTPUT, END
reg [1:0] state;

assign candidate = (valid==1) ? cnt:8'b0;

always @(posedge clk or posedge rst) begin
	if (rst==1) begin
        busy=0;
        valid=0;
        state=0;		
    end
    else begin
		// INPUT state
        if (state==0) begin
            if (en==1) begin
                busy=1;
                cnt=0;
                
					 x=1; 
					 y=1;
				   
                xa=central[23:20]; 
					 ya=central[19:16];
                xb=central[15:12]; 
					 yb=central[11:8];
                xc=central[7:4]; 
					 yc=central[3:0];				   
	
					 ra=radius[11:8];
                rb=radius[7:4];
                rc=radius[3:0];
                state=1;
				// OUTPUT state 				
            end    
        end
		// OUTPUT state
		else if (state==1) begin
		
			xa_sqr = (x-xa) * (x-xa); 
			ya_sqr = (y-ya) * (y-ya);
			xb_sqr = (x-xb) * (x-xb); 
			yb_sqr = (y-yb) * (y-yb);
			xc_sqr = (x-xc) * (x-xc); 
			yc_sqr = (y-yc) * (y-yc);
		
			if(mode == 2'b00) begin // A
				if(xa_sqr + ya_sqr <= ra * ra)
					cnt = cnt + 1;
			end
			else if(mode == 2'b01) begin
				if( (xa_sqr + ya_sqr <= ra * ra) && (xb_sqr + yb_sqr <= rb * rb) )
					cnt = cnt + 1; 
			end
			else if(mode == 2'b10) begin
				if( (xa_sqr + ya_sqr <= ra * ra) && (xb_sqr + yb_sqr > rb * rb) ||
				    (xa_sqr + ya_sqr > ra * ra)  && (xb_sqr + yb_sqr <= rb * rb) )
					cnt = cnt + 1;
			end
			else begin
				if( (xa_sqr + ya_sqr <= ra * ra) && (xb_sqr + yb_sqr <= rb * rb) && (xc_sqr + yc_sqr > rc * rc) || 
				    (xa_sqr + ya_sqr > ra * ra) && (xb_sqr + yb_sqr <= rb * rb) && (xc_sqr + yc_sqr <= rc * rc) || 
					 (xa_sqr + ya_sqr <= ra * ra) && (xb_sqr + yb_sqr > rb * rb) && (xc_sqr + yc_sqr <= rc * rc) )
					cnt = cnt + 1; 
			end
			
			if(x + 1 == 4'd9) begin
				y = y + 1;
				x = 1;
			end
			else begin
				x = x + 1;
			end
			
			if(x == 4'd1 && y == 4'd9) begin
			   state = 2;
				valid = 1;
				busy = 0;
			end
            
			// your code here
            
		end
		// END state
		else begin
            valid=0;
            busy=0;
            state=0;
			// INPUT state
      end        
   end
end
endmodule
