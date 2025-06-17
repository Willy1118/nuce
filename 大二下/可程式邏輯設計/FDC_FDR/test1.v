// Verilog test fixture created from schematic C:\ncue_logic_design\FDC_FDR\FDC_and_FDR.sch - Thu Apr 25 11:44:18 2024

`timescale 1ns / 1ps

module FDC_and_FDR_FDC_and_FDR_sch_tb();

// Inputs
   reg d;
   reg clk;
   reg rc;

// Output
   wire qc;
   wire qr;

// Bidirs

// Instantiate the UUT
   FDC_and_FDR UUT (
		.d(d), 
		.clk(clk), 
		.rc(rc), 
		.qc(qc), 
		.qr(qr)
   );
// Initialize Inputs
   initial begin
		clk = 0;
		forever #20 clk = ~clk;
	end
	initial begin
		d = 0;
		rc = 0;
		#105
		d = 1;
		rc = 0;
		#40
		d = 0;
		rc = 0;
		#40
		d = 1;
		rc = 0;
		#40
		d = 1;
		rc = 0;
		#40
		d = 1;
		rc = 1;
		#40
		d = 1;
		rc = 0;
		#40
		d = 0;
		rc = 0;
		#40
		d = 1;
		rc = 0;
	end
endmodule
