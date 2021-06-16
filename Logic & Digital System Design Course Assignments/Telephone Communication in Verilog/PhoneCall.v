`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:39:20 01/04/2021 
// Design Name: 
// Module Name:    PhoneCall 
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
module PhoneCall(input clk,
 input rst,
 input startCall, answerCall,
 input endCallCaller, endCallCallee,
 input sendCharCaller, sendCharCallee,
 input [7:0] charSent,
 output reg [63:0] statusMsg,
 output reg [63:0] sentMsg
	);

	reg [31:0] cost;
	reg [7:0] current_state;
	reg [7:0] next_state;
	… // additional registers
	// sequential part – state transitions
	always @ (posedge clk or posedge rst)
	begin
	… // your code goes here
	end
	// combinational part – next state definitions
	always @ (*)
	begin
	… // your code goes here
	end
	// sequential part – control registers
	always @ (posedge clk or posedge rst)
	begin
	… // your code goes here
	end
	// sequential part – outputs
	always @ (posedge clk or posedge rst)
	begin
	… // your code goes here
	end
	… // additional always statements
	endmodule

