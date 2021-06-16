// Verilog test fixture created from schematic C:\Xilinx\Projects\Lab2Assignment\Bit15Adder.sch - Tue Dec 01 23:27:43 2020

`timescale 1ns / 1ps

module Bit15Adder_Bit15Adder_sch_tb();

// Inputs
   reg SUB;
   reg B14;
   reg B9;
   reg B8;
   reg B7;
   reg B6;
   reg B5;
   reg B4;
   reg B3;
   reg B2;
   reg B1;
   reg B0;
   reg A1;
   reg A2;
   reg A3;
   reg A0;
   reg A4;
   reg A5;
   reg A7;
   reg A6;
   reg A8;
   reg A9;
   reg A14;
   reg A13;
   reg A12;
   reg B12;
   reg B13;
   reg B11;
   reg B10;
   reg A11;
   reg A10;

// Output
   wire C5;
   wire C6;
   wire C7;
   wire C9;
   wire C8;
   wire C13;
   wire C12;
   wire C11;
   wire C10;
   wire C14;
   wire C4;
   wire C3;
   wire C2;
   wire C1;
   wire C0;
   wire OVF;

// Bidirs

// Instantiate the UUT
   Bit15Adder UUT (
		.SUB(SUB), 
		.B14(B14), 
		.B9(B9), 
		.B8(B8), 
		.B7(B7), 
		.B6(B6), 
		.B5(B5), 
		.B4(B4), 
		.B3(B3), 
		.B2(B2), 
		.B1(B1), 
		.B0(B0), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.A0(A0), 
		.A4(A4), 
		.A5(A5), 
		.C5(C5), 
		.C6(C6), 
		.C7(C7), 
		.A7(A7), 
		.A6(A6), 
		.A8(A8), 
		.A9(A9), 
		.C9(C9), 
		.C8(C8), 
		.C13(C13), 
		.C12(C12), 
		.C11(C11), 
		.C10(C10), 
		.C14(C14), 
		.A14(A14), 
		.A13(A13), 
		.A12(A12), 
		.B12(B12), 
		.B13(B13), 
		.B11(B11), 
		.B10(B10), 
		.A11(A11), 
		.A10(A10), 
		.C4(C4), 
		.C3(C3), 
		.C2(C2), 
		.C1(C1), 
		.C0(C0), 
		.OVF(OVF)
   );
// Initialize Inputs
   
       initial begin
		SUB = 0;
		B14 = 0;
		B9 = 0;
		B8 = 0;
		B7 = 0;
		B6 = 0;
		B5 = 0;
		B4 = 0;
		B3 = 0;
		B2 = 0;
		B1 = 0;
		B0 = 0;
		A1 = 0;
		A2 = 0;
		A3 = 0;
		A0 = 0;
		A4 = 0;
		A5 = 0;
		A7 = 0;
		A6 = 0;
		A8 = 0;
		A9 = 0;
		A14 = 0;
		A13 = 0;
		A12 = 0;
		B12 = 0;
		B13 = 0;
		B11 = 0;
		B10 = 0;
		A11 = 0;
		A10 = 0;
		#10;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=10;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=-3;
		#10;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=9871;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=412;
		#10;
		SUB=1;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=-9546;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=9162;
		#10;
		{A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0}=-262;
		{B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0}=781;
		#10;

   end
endmodule
