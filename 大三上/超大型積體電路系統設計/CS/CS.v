`timescale 1ns/10ps
module CS(Y, X, reset, clk, appr, avg);
input clk, reset; 
input [7:0] X;
output reg [9:0] Y;
output reg [7:0] appr;
output reg [7:0] avg;

reg [7:0] queue [0:8];
// store the 9 input items

reg [3:0] in_cnt;
// the number of input items

reg [11:0] sum;
// the sum of 9 items

integer i;

always@(posedge clk or posedge reset) begin
	if (reset == 1) begin
		// reset output signals
		Y = 0;
		appr = 0;
		avg = 0;
		
		// reset temporary reg signals
		for(i=0 ; i<9 ; i=i+1)
			queue[i] = 0;
		in_cnt = 0;
		sum = 0;

	end
	else begin // input new item
		
		if(in_cnt < 9)
			in_cnt = in_cnt + 1;
		// update the value of cnt
		
		sum = sum + X - queue[0];
		// update the value of sum
		// +X, -queue[0]
				
		// shift the items in queue
		// queue[i+1] -> queue[i]
		// store X in queue[8]
		for(i=0 ; i<8 ; i=i+1)
			queue[i] = queue[i+1];
		queue[8] = X;

		// calculate avg and appr, when queue is full// reset appr
		if (in_cnt==9) begin
			
			// calculate avg
			avg = sum / 9;
			appr = 0;
		
			// find queue[i] which smaller than avg,  
			// and is coslest to avg
			for(i=0 ; i<9 ; i=i+1)
				if(queue[i] <= avg && queue[i] > appr)
					appr = queue[i];
		
			// calaulate Y
			#1; // for hold time
			Y = (sum + 9 * appr) / 8;

		end
	end
end
endmodule
