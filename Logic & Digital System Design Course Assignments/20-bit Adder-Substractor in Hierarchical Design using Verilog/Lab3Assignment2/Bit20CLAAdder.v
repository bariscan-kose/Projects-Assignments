`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:53:06 12/15/2020 
// Design Name: 
// Module Name:    Bit20CLAAdder 
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
module Bit20CLAAdder(A,B,Sum,Carry,SUB,OVF
    );
                                                                
	input [19:0] A,B;
	input SUB;
	output [19:0]Sum;
	output Carry,OVF;
	wire [3:0] W;
	wire [19:0]D;
	assign D[0]=B[0]^SUB;
	assign D[1]=B[1]^SUB;
	assign D[2]=B[2]^SUB;
	assign D[3]=B[3]^SUB;
	assign D[4]=B[4]^SUB;
	assign D[5]=B[5]^SUB;
	assign D[6]=B[6]^SUB;
	assign D[7]=B[7]^SUB;
	assign D[8]=B[8]^SUB;
	assign D[9]=B[9]^SUB;
	assign D[10]=B[10]^SUB;
	assign D[11]=B[11]^SUB;
	assign D[12]=B[12]^SUB;
	assign D[13]=B[13]^SUB;
	assign D[14]=B[14]^SUB;
	assign D[15]=B[15]^SUB;
	assign D[16]=B[16]^SUB;
	assign D[17]=B[17]^SUB;
	assign D[18]=B[18]^SUB;
	assign D[19]=B[19]^SUB;
	
	Bit5CLAAdder CLA1 (.A(A[4:0]),.B(D[4:0]),.Cin(SUB),.Sum(Sum[4:0]),.Carry(W[0]));
	Bit5CLAAdder CLA2 (.A(A[9:5]),.B(D[9:5]),.Cin(W[0]),.Sum(Sum[9:5]),.Carry(W[1]));
	Bit5CLAAdder CLA3 (.A(A[14:10]),.B(D[14:10]),.Cin(W[1]),.Sum(Sum[14:10]),.Carry(W[2]));
	Bit5CLAAdderL CLA4 (.A(A[19:15]),.B(D[19:15]),.Cin(W[2]),.Sum(Sum[19:15]),.Carry(W[3]),.Overflow(OVF));
	assign Carry=W[3];
	
	
	
endmodule
