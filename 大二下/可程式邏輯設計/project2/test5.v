// Verilog test fixture created from schematic C:\ncue_logic_design\project2\project2_Moore.sch - Wed Apr 24 20:56:08 2024

`timescale 1ns / 1ps

module project2_Moore_project2_Moore_sch_tb();

// Inputs
   reg x;
   reg clk;

// Output
   wire y2;
   wire y1;

// Bidirs

// Instantiate the UUT
   project2_Moore UUT (
		.x(x), 
		.y2(y2), 
		.clk(clk), 
		.y1(y1)
   );
// Initialize Inputs
   initial begin
        clk = 0;
        forever #20 clk = ~clk;
   end
    initial begin
        #20  x = 1;
        #40  x = 0;
        #40  x = 0;
        #40  x = 0;
        #40  x = 0;
        
        #40  x = 1;
        #40  x = 1;
        #40  x = 1;
        #40  x = 0;
        #40  x = 1;
        
        #40  x = 1;
        #40  x = 0;
        #40  x = 0;
        #40  x = 1;
        #40  x = 1;
        
        #40  x = 1;
        #40  x = 1;
        #40  x = 0;
        #40  x = 1;
        #40  x = 1;
   end
endmodule
