`timescale 1ns/10ps

module lcd_ctrl(clk, reset, IROM_Q, cmd, cmd_valid, 
IROM_EN, IROM_A, IRB_RW, IRB_D, IRB_A, busy, done);

input clk, reset;
input [7:0] IROM_Q;
input [2:0] cmd;
input cmd_valid;

output reg IROM_EN;
output reg [5:0] IROM_A;

output reg IRB_RW;
output reg [7:0] IRB_D;
output reg [5:0] IRB_A;

output reg busy;
output reg done;

reg [7:0] memory[0:63];
reg [2:0] x_addr, y_addr;

reg [6:0] cnt; // count the address of IROM  or IRB

// reset or command mode
parameter RST_MODE=1'b0, CMD_MODE=1'b1;
reg mode;


// your code here
// transform x_addr and y_addr into memory index
wire [5:0] idx_0 = 8*(y_addr-1) + (x_addr-1);
wire [5:0] idx_1 = 8*(y_addr-1) + x_addr;
wire [5:0] idx_2 = 8*(y_addr) + (x_addr-1);
wire [5:0] idx_3 = 8*(y_addr) + x_addr;

// the sum of 4 working points
wire [9:0] sum = memory[idx_0] + memory[idx_1] + memory[idx_2] + memory[idx_3];
// divided by 4
wire [7:0] avg = sum / 4;


always@(posedge clk or posedge reset) begin
	#(0.5); // necessary for reading data from IROM
	if (reset==1)begin // asynchronous reset
		IROM_EN<=0; // enable read
		IROM_A<=0;
		IRB_RW<=1; 	// disable write
		busy<=1; 	// enable busy
		done<=0; 	// disable done
		
		cnt<=0;
		
		// start point
		x_addr<=4; 
		y_addr<=4;
					
		mode<=RST_MODE; // start mode
	end
	else begin
		case (mode)
			RST_MODE: begin
				// read data
				IROM_A<=cnt[5:0];
					
				if (cnt>=2)
					memory[cnt-2]<=IROM_Q; // read data

				if (cnt<=64)
					cnt<=cnt+1'b1;					
				else begin
					IROM_EN<=1; 	// disable read
					busy<=0; 		// disable busy
					mode<=CMD_MODE; // change mode
					cnt<=0;
				end
			end	
			
			CMD_MODE: begin
				if (cmd_valid==1)
					busy<=1;

				// COMMAND 0: write
				if (cmd==0) begin			
					if (cnt<=63) begin		
						IRB_RW<=0; // enable write
						IRB_A<=cnt[5:0]; 
						IRB_D<=memory[cnt]; // write data
						cnt<=cnt+1'b1;			
					end
					else begin
						IRB_RW<=1;	// disable write
						cnt<=0;
						busy<=0;	// disable busy				
						done<=1; 	// enable done
					end					
				end				
				// COMMAND 1: shift up
				else if (cmd==1) begin
					if (cmd_valid==1) begin // y_addr-1
						
						if(y_addr > 1)
							y_addr = y_addr - 1;
						
					end 
					else
						busy<=0;
				end
				// COMMAND 2: shift down
				else if (cmd==2) begin
					if (cmd_valid==1) begin
						
						if(y_addr < 7)
							y_addr = y_addr + 1;
						
					end 
					else
						busy<=0;
				end
				// COMMAND 3: shift left
				else if (cmd==3) begin
					if (cmd_valid==1) begin
						
						if(x_addr > 1)
							x_addr = x_addr - 1;
						
					end 
					else
						busy<=0;
				end
				// COMMAND 4: shift right
				else if (cmd==4) begin
					if (cmd_valid==1) begin
						
						if(x_addr < 7)
							x_addr = x_addr + 1;
						
					end 
					else
						busy<=0;
				end
				// COMMAND 5: average
				else if (cmd==5) begin
					if (cmd_valid==1) begin
						
						memory[idx_0] <= avg;
						memory[idx_1] <= avg;
						memory[idx_2] <= avg;
						memory[idx_3] <= avg;
						
					end 
					else
						busy<=0;
				end
				// COMMAND 6: mirror X
				else if (cmd==6) begin
					if (cmd_valid==1) begin
						
						memory[idx_0] <= memory[idx_2];
						memory[idx_1] <= memory[idx_3];
						memory[idx_2] <= memory[idx_0];
						memory[idx_3] <= memory[idx_1];
						
					end 
					else
						busy<=0;
				end
				// COMMAND 7: mirror Y
				else if (cmd==7) begin
					if (cmd_valid==1) begin
						
						memory[idx_0] <= memory[idx_1];
						memory[idx_1] <= memory[idx_0];
						memory[idx_2] <= memory[idx_3];
						memory[idx_3] <= memory[idx_2];
						
					end 
					else
						busy<=0;
				end
				
				// your code here


			end
		endcase
	end
end
endmodule
