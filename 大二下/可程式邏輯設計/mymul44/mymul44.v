// Verilog test fixture created from schematic C:\ncue_logic_design\mymul44\mymul44.sch - Thu Mar 21 09:54:16 2024

`timescale 1ns / 1ps

module mymul44_mymul44_sch_tb();

// Inputs
   reg [3:0] a;
   reg [3:0] b;

// Output
   wire [7:0] p;

// Bidirs

// Instantiate the UUT
   mymul44 UUT (
		.a(a), 
		.b(b), 
		.p(p)
   );
// Initialize Inputs
   initial begin
        #20 a = 0; b = 0;
        #20 a = 15; b = 15;
        #20 a = 12; b = 14;
        #20 a = 7; b = 11;
        #20 a = 6; b = 4;
        #20 a = 5; b = 13;
        #20 a = 10; b = 8;
        #20 a = 14; b = 2;
        #20 a = 9; b = 13;
   end
endmodule
