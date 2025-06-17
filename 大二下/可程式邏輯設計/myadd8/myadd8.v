// Verilog test fixture created from schematic C:\ncue_logic_design\myadd8\myadd8.sch - Thu Mar 14 11:09:48 2024

`timescale 1ns / 1ps

module myadd8_myadd8_sch_tb();

// Inputs
   reg [7:0] x;
   reg [7:0] y;
   reg cin;

// Output
   wire [7:0] s;
   wire cout;

// Bidirs

// Instantiate the UUT
   myadd8 UUT (
		.x(x), 
		.y(y), 
		.cin(cin), 
		.s(s), 
		.cout(cout)
   );
// Initialize Inputs
   initial begin
		#20 cin = 0; x = 0; y = 0;
      #20 cin = 0; x = 255; y = 255;
      #20 cin = 0; x = 77; y = 55;
      #20 cin = 0; x = 123; y = 246;
      #20 cin = 0; x = 99; y = 44;
      #20 cin = 1; x = 144; y = 222;
      #20 cin = 1; x = 255; y = 255;
      #20 cin = 1; x = 77; y = 55;
      #20 cin = 1; x = 123; y = 246;
      #20 cin = 1; x = 99; y = 44;
   end
endmodule
