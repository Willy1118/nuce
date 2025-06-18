module mac (clk, reset_n, instruction, 
multiplier, multiplicand, 
stall, protect, result);

	input clk;
	input reset_n;
	input [2:0] instruction;	
	input [15:0] multiplier;
	input [15:0] multiplicand; 
	input stall;
	output reg [7:0] protect;
	output reg [31:0] result;
	
	reg [15:0] mul_1;	// multiplier
	reg [15:0] mul_2; 	// multiplicand
	reg [39:0] current_result; 
	reg [39:0] temp_result;
	reg [1:0] num_negs;

	reg [39:0] queue[1:0]; 
	// output queue, get data form queue[0]
	// for pipelining

always@(posedge clk) begin
	if (reset_n==0) begin
		protect=0;	
		result=0;

		queue[0]=0;
		queue[1]=0;
	end
	else begin 
	if (stall==0) begin
		mul_1 = multiplier;
		mul_2 = multiplicand;

		// 16x16
		if (instruction == 3'b000) 
			// clear
			current_result = 0;
		else if (instruction == 3'b001) begin
			// multiplication
			num_negs = 0; 
			// reset negative count	
			
			if (mul_1[15] == 1) begin
				// negative
				num_negs = num_negs+1'b1; 
				// increment negative count
				mul_1 = ~(mul_1-1'b1);
				// change to positive
			end
			
			if (mul_2[15] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_2 = ~(mul_2-1'b1);
			end
			
			current_result = mul_1*mul_2;
			// 16x16 multiplication
			
			if (num_negs == 1) begin
				// negative result
				current_result = (~current_result)+1'b1;
				// 2's complement
			end
		end
		else if (instruction == 3'b010) begin
			// multiplication & accumulation
			temp_result = current_result;
			
			num_negs = 0;
			if (mul_1[15] == 1) begin
				// negative
				num_negs = num_negs+1'b1; 
				// increment negative count
				mul_1 = ~(mul_1-1'b1);
				// change to positive
			end
			
			if (mul_2[15] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_2 = ~(mul_2-1'b1);
			end
			
			current_result = mul_1*mul_2;
			// 16x16 multiplication
			
			if (num_negs == 1) begin
				// negative result
				current_result = (~current_result)+1'b1;
				// 2's complement
			end
			
			current_result = temp_result + current_result;
			// accumulation
		end
		else if (instruction == 3'b011) begin
			// saturation 16
			if (current_result[39] == 0 && 
				current_result > 40'h007fffffff)
				// positive result, overflow
				current_result[31:0] = 32'h7fffffff;
			else if (current_result[39] == 1 && 
				current_result < 40'hff80000000)
				// negative result, underflow
				current_result[31:0] = 32'h80000000;
			else
				// no overflow, no underflow
				current_result[31:16] = 16'h0000;
				current_result[15:0] = current_result[31:0];
		end
		// 8x8
		else if (instruction == 3'b100) 
			// clear
			current_result = 0;
		else if (instruction == 3'b101) begin
			// for [7:0]
			num_negs = 0;
			// reset negative count
			
			if (mul_1[7] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_1[7:0] = ~(mul_1[7:0]-1'b1);
			end
			
			if (mul_2[7] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_2[7:0] = ~(mul_2[7:0]-1'b1);
			end

			{current_result[35:32], current_result[15:0]} = 
				mul_1[7:0]*mul_2[7:0];
			// 8x8 multiplication
			
			if (num_negs == 1) begin
				// negative result
				{current_result[35:32], current_result[15:0]} = 
					~{current_result[35:32], current_result[15:0]}+1'b1;
			end
		
			// for [15:8]
			num_negs = 0;
			
			if (mul_1[15] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_1[15:8] = ~(mul_1[15:8]-1'b1);
			end
			
			if (mul_2[15] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_2[15:8] = ~(mul_2[15:8]-1'b1);
			end
			
			{current_result[39:36], current_result[31:16]} = 
				mul_1[15:8]*mul_2[15:8];
	
			if (num_negs == 1) begin
				{current_result[39:36], current_result[31:16]} = 
					~{current_result[39:36], current_result[31:16]}+1'b1;
			end	
		end
		else if (instruction == 3'b110) begin
			// multiplication & accumulation
			temp_result = current_result;
			
			// for [7:0]
			num_negs = 0;
			
			if (mul_1[7] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_1[7:0] = ~(mul_1[7:0]-1'b1);
			end
			
			if (mul_2[7] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_2[7:0] = ~(mul_2[7:0]-1'b1);
			end
			
			{current_result[35:32], current_result[15:0]} = 
				mul_1[7:0]*mul_2[7:0];

			if (num_negs == 1) begin
				// negative result
				{current_result[35:32], current_result[15:0]} = 
					~{current_result[35:32], current_result[15:0]}+1'b1;
			end
			
			{current_result[35:32], current_result[15:0]} = 
					{temp_result[35:32], temp_result[15:0]} + 
					{current_result[35:32], current_result[15:0]};
			
			// for [15:8]
			num_negs = 0;
			
			if (mul_1[15] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_1[15:8] = ~(mul_1[15:8]-1'b1);
			end
			
			if (mul_2[15] == 1) begin
				num_negs = num_negs+1'b1; 
				mul_2[15:8] = ~(mul_2[15:8]-1'b1);
			end
			
			{current_result[39:36], current_result[31:16]} = 
				mul_1[15:8]*mul_2[15:8];
			
			if (num_negs == 1) begin
				{current_result[39:36], current_result[31:16]} = 
					~{current_result[39:36], current_result[31:16]}+1'b1;
			end
	
			{current_result[39:36], current_result[31:16]} = 
					{temp_result[39:36], temp_result[31:16]} + 
					{current_result[39:36], current_result[31:16]};	
					
		end
		else if (instruction == 3'b111) begin
			// for [15:0]
			if (current_result[35] == 0 && 
				{current_result[35:32], current_result[15:0]} > 20'h07fff)
				// positive result, overflow
				current_result[15:0] = 16'h7fff;
			else if (current_result[35] == 1 && 
				{current_result[35:32], current_result[15:0]} < 20'hf8000)
				// negative result, underflow
				current_result[15:0] = 16'h8000;
			else
				// no overflow, no underflow
				current_result[15:0] = current_result[15:0];
			
			// for [31:16]
			
			if (current_result[39] == 0 && 
				{current_result[39:36], current_result[31:16]} > 20'h07fff)
				// positive result, overflow
				current_result[31:16] = 16'h7fff;
			else if (current_result[39] == 1 && 
				{current_result[39:36], current_result[31:16]} < 20'hf8000)
				// negative result, underflow
				current_result[31:16] = 16'h8000;
			else
				// no overflow, no underflow
				current_result[31:16] = current_result[31:16];

		end
		
		{protect, result} = queue[0]; 
		// get data from queue[0]
			
		queue[0] = queue[1];
		queue[1] = current_result;
	end // stall == 0

	end // reset_n == 1
end // posedge clk
endmodule
