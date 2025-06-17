// Verilog test fixture created from schematic C:\ncue_logic_design\project2\project2_Moore.sch - Wed Apr 24 22:00:50 2024

`timescale 1ns / 1ps

module project2_Moore_project2_Moore_sch_tb();

// Inputs
   reg x;
   reg clk;

// Output
   wire Z;

// Bidirs

// Instantiate the UUT
   project2_Moore UUT (
		.x(x), 
		.clk(clk), 
		.Z(Z)
   );
// Initialize Inputs
   initial begin
        clk = 0;
        forever #20 clk = ~clk;
   end
    initial begin
        #130  x = 1;
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
