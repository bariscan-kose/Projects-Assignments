// Verilog test fixture created from schematic C:\Xilinx\Projects\Lab2Assignment\Bit3Adder.sch - Tue Dec 01 22:08:53 2020

`timescale 1ns / 1ps

module Bit3Adder_Bit3Adder_sch_tb();

// Inputs
   reg CarryI;
   reg A;
   reg B;

// Output
   wire Sum;
   wire CarryO;

// Bidirs

// Instantiate the UUT
   Bit3Adder UUT (
		.Sum(Sum), 
		.CarryI(CarryI), 
		.A(A), 
		.B(B), 
		.CarryO(CarryO)
   );
// Initialize Inputs
  
       initial begin
		CarryI = 0;
		A = 0;
		B = 0;
		#10;
		B=1;
   end
endmodule
