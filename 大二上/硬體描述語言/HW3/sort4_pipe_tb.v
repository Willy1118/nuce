module sort4_pipe_tb;
	
	reg clk, rst;
	reg [7:0] x0, x1, x2, x3;
	wire [7:0] y0, y1, y2, y3;

	sort4_pipe m0 (clk, rst, x0, x1, x2, x3, y0, y1, y2, y3);

	initial begin
        	rst = 1;
		clk = 0;

       		#20 rst = 0;
	end


	always
		#10 clk = ~clk;

	
	initial begin
		#20 x0 = 8'd38 ; x1 = 8'd94 ; x2 = 8'd61 ; x3 = 8'd50;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
			
		#20 x0 = 8'd24 ; x1 = 8'd15 ; x2 = 8'd82 ; x3 = 8'd65;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);

		#20 x0 = 8'd89 ; x1 = 8'd20 ; x2 = 8'd63 ; x3 = 8'd51;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);

		#20 x0 = 8'd72 ; x1 = 8'd24 ; x2 = 8'd36 ; x3 = 8'd77;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);

		#20 x0 = 8'd50 ; x1 = 8'd69 ; x2 = 8'd13 ; x3 = 8'd30;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");

		#20 x0 = 8'd23 ; x1 = 8'd60 ; x2 = 8'd30 ; x3 = 8'd11;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");

		#20 x0 = 8'd45 ; x1 = 8'd54 ; x2 = 8'd22 ; x3 = 8'd56;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");

		#20 x0 = 8'd71 ; x1 = 8'd42 ; x2 = 8'd90 ; x3 = 8'd89;
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");
			
		#20
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");

		#20
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");

		#20
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");

		#20
		$display("Time: %3t ns, Inputs: x0 = %2d  x1 = %2d  x2 = %2d  x3 = %2d, Outputs: y0 = %2d  y1 = %2d  y2 = %2d  y3 = %2d", $time ,x0, x1, x2, x3, y0, y1, y2, y3);
		if(y0 <= y1 && y1 <= y2 && y2 <= y3)
			$display("Pass!");
		else
			$display("Fail!");
			
		#20 $finish;
	end	
	
endmodule