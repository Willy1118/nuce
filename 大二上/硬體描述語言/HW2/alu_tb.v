module alu_tb();

reg[5:0] A, B; // 暫存器A,B
reg[3:0] op; // 暫存器op
wire[5:0] Y; // 線Y

alu A0(A, B, op, Y); //呼叫module alu

initial //輸出(A,B,op,其中一個信號發生變化即輸出)
	$monitor("Time: %3t ns,  Inputs: A = %6b, B = %6b, op = %4h\, $time, A, B, op, Y);

initial //測試資料
    begin
	#10 A = 6'b001100; B = 6'b000101; op = 4'h0; 
    	#10 op = 4'h1;
    	#10 op = 4'h2;
    	#10 op = 4'h3;
    	#10 op = 4'h4;
    	#10 op = 4'h5;
    	#10 op = 4'h6;
    	#10 op = 4'h7;
    	#10 op = 4'h8;
    	#10 op = 4'h9;
    	#10 op = 4'hA;
    	#10 op = 4'hB;
    	#10 op = 4'hC;
    	#10 op = 4'hD;
    	#10 op = 4'hE;
    	#10 op = 4'hF;
    
    	#10 A = 6'b000111; B = 6'b001011; op = 4'h0;
    	#10 op = 4'h1;
    	#10 op = 4'h2;
    	#10 op = 4'h3;
    	#10 op = 4'h4;
    	#10 op = 4'h5;
    	#10 op = 4'h6;
    	#10 op = 4'h7;
    	#10 op = 4'h8;
    	#10 op = 4'h9;
    	#10 op = 4'hA;
    	#10 op = 4'hB;
    	#10 op = 4'hC;
    	#10 op = 4'hD;
    	#10 op = 4'hE;
    	#10 op = 4'hF;

    	#10 $finish;
    end

endmodule