// Verilog test fixture created from schematic C:\Xilinx\Projects\Lab2Assignment2\Bit15CLAAdderSubtractor.sch - Wed Dec 02 02:13:08 2020

`timescale 1ns / 1ps

module Bit15CLAAdderSubtractor_Bit15CLAAdderSubtractor_sch_tb();

// Inputs
   reg SUB;
   reg A0;
   reg A1;
   reg A2;
   reg B0;
   reg B1;
   reg B2;
   reg A3;
   reg A4;
   reg A5;
   reg B3;
   reg B4;
   reg B7;
   reg B6;
   reg A8;
   reg A7;
   reg A6;
   reg A9;
   reg A10;
   reg A11;
   reg A14;
   reg A13;
   reg A12;
   reg B9;
   reg B10;
   reg B12;
   reg B13;
   reg B14;
   reg B11;
   reg B8;
   reg B5;

// Output
   wire C11;
   wire C10;
   wire C9;
   wire C8;
   wire C7;
   wire C6;
   wire C5;
   wire C4;
   wire C3;
   wire C2;
   wire C1;
   wire C0;
   wire OVF;
   wire C14;
   wire C13;
   wire C12;

// Bidirs

// Instantiate the UUT
   Bit15CLAAdderSubtractor UUT (
		.SUB(SUB), 
		.A0(A0), 
		.A1(A1), 
		.A2(A2), 
		.B0(B0), 
		.B1(B1), 
		.B2(B2), 
		.A3(A3), 
		.A4(A4), 
		.A5(A5), 
		.B3(B3), 
		.B4(B4), 
		.B7(B7), 
		.B6(B6), 
		.A8(A8), 
		.A7(A7), 
		.A6(A6), 
		.A9(A9), 
		.A10(A10), 
		.A11(A11), 
		.C11(C11), 
		.C10(C10), 
		.C9(C9), 
		.C8(C8), 
		.C7(C7), 
		.C6(C6), 
		.C5(C5), 
		.C4(C4), 
		.C3(C3), 
		.C2(C2), 
		.C1(C1), 
		.C0(C0), 
		.OVF(OVF), 
		.C14(C14), 
		.C13(C13), 
		.C12(C12), 
		.A14(A14), 
		.A13(A13), 
		.A12(A12), 
		.B9(B9), 
		.B10(B10), 
		.B12(B12), 
		.B13(B13), 
		.B14(B14), 
		.B11(B11), 
		.B8(B8), 
		.B5(B5)
   );
// Initialize Inputs
   
       initial begin
		SUB = 0;
		A0 = 0;
		A1 = 0;
		A2 = 0;
		B0 = 0;
		B1 = 0;
		B2 = 0;
		A3 = 0;
		A4 = 0;
		A5 = 0;
		B3 = 0;
		B4 = 0;
		B7 = 0;
		B6 = 0;
		A8 = 0;
		A7 = 0;
		A6 = 0;
		A9 = 0;
		A10 = 0;
		A11 = 0;
		A14 = 0;
		A13 = 0;
		A12 = 0;
		B9 = 0;
		B10 = 0;
		B12 = 0;
		B13 = 0;
		B14 = 0;
		B11 = 0;
		B8 = 0;
		B5 = 0;
		#10;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=9650;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=9356;
		#10;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=8431;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=1534;
		#10;
		SUB=1;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=4181;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=-1000;
		#10;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=-9485;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=9786;

   end
endmodule
