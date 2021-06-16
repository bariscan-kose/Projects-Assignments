// Verilog test fixture created from schematic C:\Xilinx\Projects\Lab2Assignment2\Bit3CarryLookAheadAdder.sch - Wed Dec 02 01:12:45 2020

`timescale 1ns / 1ps

module Bit3CarryLookAheadAdder_Bit3CarryLookAheadAdder_sch_tb();

// Inputs
   reg B2_3;
   reg A2_3;
   reg B0_3;
   reg A0_3;
   reg C0_3;
   reg B1_3;
   reg A1_3;

// Output
   wire C3_3;
   wire S0_3;
   wire S1_3;
   wire S2_3;

// Bidirs

// Instantiate the UUT
   Bit3CarryLookAheadAdder UUT (
		.B2_3(B2_3), 
		.A2_3(A2_3), 
		.B0_3(B0_3), 
		.A0_3(A0_3), 
		.C0_3(C0_3), 
		.B1_3(B1_3), 
		.A1_3(A1_3), 
		.C3_3(C3_3), 
		.S0_3(S0_3), 
		.S1_3(S1_3), 
		.S2_3(S2_3)
   );
// Initialize Inputs
   
       initial begin
		B2_3 = 0;
		A2_3 = 0;
		B0_3 = 0;
		A0_3 = 0;
		C0_3 = 0;
		B1_3 = 0;
		A1_3 = 0;
		#10;
		A1_3=1;
		#10;
		B1_3=1;
		#10;
		A2_3=1;
		#10;
		B2_3=1;
		#10;
		A0_3=1;
		#10;
		end
   
endmodule
