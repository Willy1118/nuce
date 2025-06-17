// Verilog test fixture created from schematic C:\ncue_logic_design\full_adder\fa.sch - Tue Mar 12 14:03:20 2024

`timescale 1ns / 1ps

module fa_fa_sch_tb();

// Inputs
   reg cin;
   reg a;
   reg b;

// Output
   wire sum;
   wire cout;

// Bidirs

// Instantiate the UUT
   fa UUT (
		.sum(sum), 
		.cin(cin), 
		.a(a), 
		.b(b), 
		.cout(cout)
   );
// Initialize Inputs
   initial begin
		#20 a = 0; b = 0; cin = 0;
		#20 a = 0; b = 0; cin = 1;
		#20 a = 0; b = 1; cin = 0;
		#20 a = 0; b = 1; cin = 1;
		#20 a = 1; b = 0; cin = 0;
		#20 a = 1; b = 0; cin = 1;
		#20 a = 1; b = 1; cin = 0;
		#20 a = 1; b = 1; cin = 1;
   end
endmodule
