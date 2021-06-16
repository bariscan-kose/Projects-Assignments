`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:50 12/16/2020 
// Design Name: 
// Module Name:    Bit5CLAAdderL 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Bit5CLAAdderL(A,B,Cin,Sum,Carry,Overflow
    );
	 input [4:0]A,B;
	 input Cin;
	 output [4:0]Sum;
	 output Carry;
	 output Overflow;
	 wire [4:0]P,G,C;
	 
	 assign P[0]=A[0]^B[0];
	 assign G[0]=A[0]&B[0];
	 
	 assign P[1]=A[1]^B[1];
	 assign G[1]=A[1]&B[1];
	 
	 assign P[2]=A[2]^B[2];
	 assign G[2]=A[2]&B[2];
	 
	 assign P[3]=A[3]^B[3];
	 assign G[3]=A[3]&B[3];
	 
	 assign P[4]=A[4]^B[4];
	 assign G[4]=A[4]&B[4];
	 
	 assign Sum[0]=P[0]^Cin;
	 assign C[0]=G[0]|(P[0]&Cin);
	 
	 assign Sum[1]=P[1]^C[0];
	 assign C[1]=G[1]|(P[1]&G[0])|(P[1]&P[0]&Cin);
	 
	 assign Sum[2]=P[2]^C[1];
	 assign C[2]=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&Cin);
	
	 assign Sum[3]=P[3]^C[2];
	 assign C[3]=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&Cin);

	 assign Sum[4]=P[4]^C[3];
	 assign C[4]=G[4]|(P[4]&G[3])|(P[4]&P[3]&G[2])|(P[4]&P[3]&P[2]&G[1])|(P[4]&P[3]&P[2]&P[1]&G[0])|(P[4]&P[3]&P[2]&P[1]&P[0]&Cin);
	 
	 assign Carry=C[4];
	 assign Overflow= C[3] ^ C[4];

endmodule
