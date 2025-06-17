// Verilog test fixture created from schematic C:\ncue_logic_design\myadd4\myadd4.sch - Thu Mar 14 10:57:00 2024

`timescale 1ns / 1ps

module myadd4_myadd4_sch_tb();

// Inputs
   reg [3:0] x;
   reg [3:0] y;
   reg cin;

// Output
   wire cout;
   wire [3:0] s;

// Bidirs

// Instantiate the UUT
   myadd4 UUT (
		.x(x), 
		.y(y), 
		.cin(cin), 
		.cout(cout), 
		.s(s)
   );
// Initialize Inputs
   initial begin
		#20 x = 0; y = 0; cin = 0;
      #20 x = 1; y = 5; cin = 0;
      #20 x = 2; y = 8; cin = 0;
      #20 x = 15; y = 15; cin = 0;
      #20 x = 1; y = 5; cin = 1;
      #20 x = 2; y = 8; cin = 1;
      #20 x = 4; y = 7; cin = 1;
      #20 x = 11; y = 4; cin = 1;
   end
endmodule
