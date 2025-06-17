// Verilog test fixture created from schematic C:\ncue_logic_design\half_adder\ha.sch - Tue Mar 12 13:49:13 2024

`timescale 1ns / 1ps

module ha_ha_sch_tb();

// Inputs
   reg a;
   reg b;

// Output
   wire sum;
   wire carry;

// Bidirs

// Instantiate the UUT
   ha UUT (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry)
   );
// Initialize Inputs
   initial begin
		#20 a = 0; b = 0;
		#20 a = 0; b = 1;
		#20 a = 1; b = 0;
		#20 a = 1; b = 1;
	end
endmodule
