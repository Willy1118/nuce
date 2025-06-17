// Verilog test fixture created from schematic C:\ncue_logic_design\full_adder2\fa.sch - Wed Mar 06 22:29:57 2024

`timescale 1ns / 1ps

module fa_fa_sch_tb();

// Inputs
   reg a;
   reg b;
   reg cin;

// Output
   wire sum;
   wire cout;

// Bidirs

// Instantiate the UUT
   fa UUT (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
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
