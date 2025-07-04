`timescale 1ns/10ps

module avg(clk, reset, din, ready, dout);
	input  clk, reset;
	input  [15:0] din;       // 輸出數字
	output reg ready;        // 輸出ready
	output reg [15:0] dout;  // 輸出數字
	
	reg [15:0] queue [11:0]; // 存放12個數字的queue[11:0]
									 // 每個數字[15:0]
	reg [3:0]  idx;          // 紀錄目前存放之數字個數[3:0]count
	reg [19:0] sum;          // 12個數字的總和[19:0] sum
	reg [15:0] average;      // 12個數字的平均[15:0] average
	
	reg [15:0] min;          // 目前的最小差值[15:0]min
	reg [15:0] ans;          // 目前的答案輸出[15:0]ans
	
	integer i;
	
	always@ (posedge clk or posedge reset) begin
		if (reset == 1'b1) begin
			ready = 1'b0;
			dout  = 16'd0;
			idx   = 4'd0;
			sum   = 20'd0;
		end
		else begin
		
			if (idx <= 4'd11) begin
				queue[idx] = din;
				sum = sum + queue[idx];
				idx = idx + 4'd1;
			end
			
			else begin
				sum = sum - queue[0];
				for(i=0 ; i<11 ; i=i+1)
					queue[i] = queue[i+1];
				queue[11] = din;
				sum = sum + queue[11];
			end
			
			if (idx == 4'd12) begin
				#5 ready = 1'b1;
				
				average = sum / 12;
				min = 16'hffff;
				
				for (i=0 ; i<12 ; i = i+1) begin
					if (average > queue[i]) begin
						if(average - queue[i] <= min) begin
							min = average - queue[i];
							ans = queue[i];
						end
					end
					else begin
						if(queue[i] - average < min) begin
							min = queue[i] - average;  
							ans = queue[i];
						end
					end
				end
			#5 dout = ans;
			end
		end
	end
		
endmodule  		