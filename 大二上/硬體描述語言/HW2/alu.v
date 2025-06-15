module alu(A, B, op, y);

input[5:0] A, B; //輸入A,B
input[3:0] op; //輸入op
output[5:0] y; //輸出y
reg[5:0] y;

always @ (A or B or op) //當A,B或op訊號發生改變時
begin
    case(op) //op值
        4'h0 : y = A; // op之值為4’h0時，Y之值為 A
        4'h1 : y = B; // op之值為4’h1時，Y之值為 B
	4'h2 : y = A + 1; // op之值為4’h2時，Y之值為 A + 1
	4'h3 : y = B + 1; // op之值為4’h3時，Y之值為 B + 1
	4'h4 : y = A - 1; // op之值為4’h4時，Y之值為 A - 1
	4'h5 : y = B - 1; // op之值為4’h5時，Y之值為 B - 1
	4'h6 : y = A + B; // op之值為4’h6時，Y之值為 A + B
	4'h7 : y = A - B; // op之值為4’h7時，Y之值為 A - B
	4'h8 : y = A & B; // op之值為4’h8時，Y之值為 bit-wise A AND B
	4'h9 : y = A | B; // op之值為4’h9時，Y之值為 bit-wise A OR B
	4'hA : y = A ^ B; // op之值為4’hA時，Y之值為 bit-wise A XOR B
	4'hB : y = ~ A; // op之值為4’hB時，Y之值為 bit-wise NOT A
	4'hC : y = A << 1; // op之值為4’hC時，Y之值為 A 左移一個位元 (右邊補0)
	4'hD : y = A >> 1; // op之值為4’hD時，Y之值為 A 右移一個位元 (左邊補0)
	4'hE : y = (A > B) ? A : B; // op之值為4’hE時，Y之值為 A、B中較大者
	4'hF : y = (A < B) ? A : B; // op之值為4’hF時，Y之值為 A、B中較小者
    endcase
end

endmodule

