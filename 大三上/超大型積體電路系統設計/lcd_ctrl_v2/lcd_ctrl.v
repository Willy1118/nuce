// 2007
`timescale 1ns/10ps

module lcd_ctrl(clk, reset, datain, cmd, cmd_valid,
				dataout, output_valid, busy);
input clk, reset;
input [7:0] datain;
input [2:0] cmd;
input cmd_valid;

output [7:0] dataout;
output output_valid, busy;

reg [7:0] dataout;
reg output_valid, busy;

parameter RST_MODE=1'b0, CMD_MODE=1'b1;
reg mode; // reset or command mode

reg [2:0] x_addr, y_addr;
reg [2:0] cmd_use; 
// store the acceptable command
reg [6:0] pc; 
// store the circuit state for each clock

reg [7:0] image_buf[63:0];
// store the 8x8 pixels
reg [7:0] output_buf[15:0];
// store the pixels to be displayed

parameter REFRESH=3'd0, LOAD_DATA=3'd1, ZOOM_IN=3'd2, ZOOM_OUT=3'd3,
SHIFT_RIGHT=3'd4, SHIFT_LEFT=3'd5, SHIFT_UP=3'd6, SHIFT_DOWN=3'd7;

parameter ZOOM_OUT_STATE=1'b0, ZOOM_IN_STATE=1'b1;
reg magnification;

integer i;

always@(posedge clk or posedge reset) begin
	#(0.5);
	if (reset==1) begin
		dataout<=0;
		output_valid<=0;
		busy<=0;	
		mode<=RST_MODE;		
	end
	else begin
		case (mode)
			RST_MODE: begin		
				if (cmd_valid==1) begin
					mode<=CMD_MODE;
					pc<=1;
					busy<=1;
					cmd_use<=cmd;
				end
			end	
			
			CMD_MODE: begin
				if (cmd_valid==1) begin
					// determine if the new command can be used
					// if old command is zoom out
					// and new command is shift
					// keep at zoom out
					// else accept new command
					if (magnification==ZOOM_OUT_STATE && 
						(cmd==SHIFT_RIGHT || cmd==SHIFT_LEFT || 
						 cmd==SHIFT_UP || cmd==SHIFT_DOWN))
						// zoom out, receive shift command 
						cmd_use<=ZOOM_OUT;   // stay at zoom out
					else
						cmd_use<=cmd; // new command
					busy <= 1;
					output_valid<=0;
				end
				else
					cmd_use<=cmd_use;
					// keep old command
				
				// COMMAND 1: LOAD DATA	
				if (cmd_use==LOAD_DATA) begin
						
					// ******
					// your code here (about 60 lines of code)
				
					if(pc <= 64) begin
						image_buf[pc-1] <= datain;
					end
					
					if(pc == 65) begin
						output_buf[0] <=image_buf[0] ;
						output_buf[1] <=image_buf[2] ;
						output_buf[2] <=image_buf[4] ;
						output_buf[3] <=image_buf[6] ;
						output_buf[4] <=image_buf[16];
						output_buf[5] <=image_buf[18];
						output_buf[6] <=image_buf[20];
						output_buf[7] <=image_buf[22];
						output_buf[8] <=image_buf[32];
						output_buf[9] <=image_buf[34];
						output_buf[10]<=image_buf[36];
						output_buf[11]<=image_buf[38];
						output_buf[12]<=image_buf[48];
						output_buf[13]<=image_buf[50];
						output_buf[14]<=image_buf[52];
						output_buf[15]<=image_buf[54];
					end
					
					if (pc>=66) begin	
						output_valid<=1;					
						case (pc-63)
						3:  dataout<=output_buf[0];
						4:  dataout<=output_buf[1];
						5:  dataout<=output_buf[2];
						6:  dataout<=output_buf[3];
						7:  dataout<=output_buf[4];
						8:  dataout<=output_buf[5];
						9:  dataout<=output_buf[6];
						10: dataout<=output_buf[7];
						11: dataout<=output_buf[8];
						12: dataout<=output_buf[9];
						13: dataout<=output_buf[10];
						14: dataout<=output_buf[11];
						15: dataout<=output_buf[12];
						16: dataout<=output_buf[13];
						17: dataout<=output_buf[14];
						18: dataout<=output_buf[15];
						default: dataout <= dataout;
						endcase
					end
					else
						output_valid<=0;
						
					
					if(pc < 81)
						pc <= pc + 1;
					else begin
						busy <= 0;
						pc <= 0;
					end
					
					// ******
					
				end
				else begin
					if (cmd_use==REFRESH) begin
						// COMMAND 0: REFRESH
						for (i=0; i<=15; i=i+1)
							output_buf[i]<=output_buf[i];	
					end
					else if (cmd_use==ZOOM_IN || cmd_use==ZOOM_OUT) begin
						// COMMAND 2 or 3: ZOOM_IN or ZOOM_OUT
		
						// pc==1: idle			
						if (pc==2 && cmd_use==ZOOM_IN) begin
							magnification=ZOOM_IN_STATE;
							x_addr<=2;
							y_addr<=2;
							// zoom in at (2, 2)
							output_buf[0] <=image_buf[18];
							output_buf[1] <=image_buf[19];
							output_buf[2] <=image_buf[20];
							output_buf[3] <=image_buf[21];
							output_buf[4] <=image_buf[26];
							output_buf[5] <=image_buf[27];
							output_buf[6] <=image_buf[28];
							output_buf[7] <=image_buf[29];
							output_buf[8] <=image_buf[34];
							output_buf[9] <=image_buf[35];
							output_buf[10]<=image_buf[36];
							output_buf[11]<=image_buf[37];
							output_buf[12]<=image_buf[42];
							output_buf[13]<=image_buf[43];
							output_buf[14]<=image_buf[44];
							output_buf[15]<=image_buf[45];
						end
						else if (pc==2 && cmd_use==ZOOM_OUT) begin							
							magnification=ZOOM_OUT_STATE;
							// zoom out at (0,0)
							output_buf[0] <=image_buf[0] ;
							output_buf[1] <=image_buf[2] ;
							output_buf[2] <=image_buf[4] ;
							output_buf[3] <=image_buf[6] ;
							output_buf[4] <=image_buf[16];
							output_buf[5] <=image_buf[18];
							output_buf[6] <=image_buf[20];
							output_buf[7] <=image_buf[22];
							output_buf[8] <=image_buf[32];
							output_buf[9] <=image_buf[34];
							output_buf[10]<=image_buf[36];
							output_buf[11]<=image_buf[38];
							output_buf[12]<=image_buf[48];
							output_buf[13]<=image_buf[50];
							output_buf[14]<=image_buf[52];
							output_buf[15]<=image_buf[54];
						end
					end
					else begin
						// COMMAND 4-7: SHIFT RIGHT, LEFT, UP, DOWN
						
						// ******
						if(pc == 1) begin
							if(cmd_use == SHIFT_RIGHT) begin
								if(x_addr < 4) 
									x_addr <= x_addr + 1;	
							end
							if(cmd_use == SHIFT_LEFT) begin
								if(x_addr > 0) 
									x_addr <= x_addr - 1;	
							end
							if(cmd_use == SHIFT_UP) begin
								if(y_addr > 0) 
									y_addr <= y_addr - 1;	
							end
							if(cmd_use == SHIFT_DOWN) begin
								if(y_addr < 4) 
									y_addr <= y_addr + 1;	
							end
						end
						if(pc == 2) begin
							
							output_buf[0] <=image_buf[8*y_addr + x_addr] ;
							output_buf[1] <=image_buf[8*y_addr + (x_addr+1)] ;
							output_buf[2] <=image_buf[8*y_addr + (x_addr+2)] ;
							output_buf[3] <=image_buf[8*y_addr + (x_addr+3)] ;
							
							output_buf[4] <=image_buf[8*(y_addr+1) + x_addr];
							output_buf[5] <=image_buf[8*(y_addr+1) + (x_addr+1)];
							output_buf[6] <=image_buf[8*(y_addr+1) + (x_addr+2)];
							output_buf[7] <=image_buf[8*(y_addr+1) + (x_addr+3)];
							
							output_buf[8] <=image_buf[8*(y_addr+2) + x_addr];
							output_buf[9] <=image_buf[8*(y_addr+2) + (x_addr+1)];
							output_buf[10]<=image_buf[8*(y_addr+2) + (x_addr+2)];
							output_buf[11]<=image_buf[8*(y_addr+2) + (x_addr+3)];
							
							output_buf[12]<=image_buf[8*(y_addr+3) + x_addr];
							output_buf[13]<=image_buf[8*(y_addr+3) + (x_addr+1)];
							output_buf[14]<=image_buf[8*(y_addr+3) + (x_addr+2)];
							output_buf[15]<=image_buf[8*(y_addr+3) + (x_addr+3)];
							
						end
						
						// ******
						
					end
						
					if (pc>=0 && pc<=17) begin
						pc<=pc+1'b1;
						busy<=1;
					end
					else begin
						// pc==18
						pc<=0;
						busy<=0;
					end					
						
					if (pc>=3 && pc<=18) begin	
						output_valid<=1;					
						case (pc)
						3:  dataout<=output_buf[0];
						4:  dataout<=output_buf[1];
						5:  dataout<=output_buf[2];
						6:  dataout<=output_buf[3];
						7:  dataout<=output_buf[4];
						8:  dataout<=output_buf[5];
						9:  dataout<=output_buf[6];
						10: dataout<=output_buf[7];
						11: dataout<=output_buf[8];
						12: dataout<=output_buf[9];
						13: dataout<=output_buf[10];
						14: dataout<=output_buf[11];
						15: dataout<=output_buf[12];
						16: dataout<=output_buf[13];
						17: dataout<=output_buf[14];
						18: dataout<=output_buf[15];
						default: dataout <= dataout;
						endcase
					end
					else
						output_valid<=0;
				end // other commands except load-data
			end // CMD_MODE
		endcase
	end
end
endmodule
