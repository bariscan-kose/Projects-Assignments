`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:35:22 12/16/2020
// Design Name:   Bit20CLAAdder
// Module Name:   C:/Xilinx/Projects/Lab3Assignment2/Bit20CLATest.v
// Project Name:  Lab3Assignment2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Bit20CLAAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Bit20CLATest;

	// Inputs
	reg [19:0] A;
	reg [19:0] B;
	reg SUB;

	// Outputs
	wire [19:0] Sum;
	wire Carry;
	wire OVF;

	// Instantiate the Unit Under Test (UUT)
	Bit20CLAAdder uut (
		.A(A), 
		.B(B), 
		.Sum(Sum), 
		.Carry(Carry), 
		.SUB(SUB), 
		.OVF(OVF)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		SUB = 0;

		#10;
		
		A=20'b01111111111111000010;
		B=20'b01011011101011000100;
		#10;
		
		A=20'b01010001010100011010;
		B=20'b10111010011011001001;
		#10;
		
		SUB=1;
		A=20'b01001000010100011010;
		B=20'b11010001010100011010;
		#10;
		
		A=20'b01010001010100011010;
		B=20'b00100010110011100111;
		#10;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

