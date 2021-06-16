`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:22:05 01/05/2021 
// Design Name: 
// Module Name:    tel 
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
module tell(input clk,
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
	
	// sequential part - state transitions
		always @ (posedge clk or posedge rst)
		begin
		if (rst)
			begin
			current_state<=130;
			end
		else if (endCallCaller)
			begin
			if(current_state>99 & current_state<110)
				current_state<=130;
			else
				current_state<=124;
			end
		else if (endCallCallee)
			begin
			if(current_state>99 & current_state<110)
				current_state<=119;
			else
				current_state<=129;
			end
		else
			begin
			current_state<=next_state;
			end
		end
		
	
	always @ (*)
	begin
	if(rst)
		begin
		next_state<=130;
		cost <='h0;
		end
	else if(current_state==130)
		begin 
		if(startCall)
			next_state<=109;
		else 
			next_state<=130;
		end
	else if ( current_state < 110 & current_state > 100)
		begin
		if (answerCall)
			begin
			next_state<=3;
			end
		else
			begin
			next_state<=current_state - 1;
			end
		end
	else if(current_state>130 & current_state<133) //they are conversing now
		begin
		if(current_state==131)
			begin
			if (sendCharCaller)
				begin 
				if(charSent>31 & charSent<127)
					begin
					next_state<=131;
					if (charSent>47 & charSent<58) 
						cost<=cost+1;
					else
						cost<=cost +2;
					end				
				else if (charSent == 127)
					begin
					next_state<=132;
					cost<=cost+2;
					end
				else
					begin
					next_state<=131;
					end
				end
			else
				begin
				next_state<=131;
				end
			end
		else
			begin
			if (sendCharCallee)
				begin 
				if(charSent>31 & charSent<127)
					begin
					next_state<=132;
					if (charSent>47 & charSent<58) 
						cost<=cost+1;
					else 
						cost<=cost +2;
					end				
				else if (charSent == 127)
					begin
					next_state<=131;
					cost<=cost+2;
					end
				else
					begin
					next_state<=132;
					end
				end
			else
				begin
				next_state<=132;
				end
			end
		end
	else if ( current_state==100 | current_state==110 | current_state== 120 | current_state==125)
		begin
		next_state<=130;
		end
		//there should be else here;	
	else 
		begin
		next_state<=current_state -1 ;
		end
	end
	
	// sequential part - outputs
	always @ (*)
	begin
	if(rst)
		begin
		statusMsg[63:0]<=0;
		sentMsg[63:0]<=0;
		end
	else 
		begin
		case (current_state)
		130: begin // initial idle state
			statusMsg<="IDLE    ";
			sentMsg<=0;
		end
/*		2: begin //call and end it yourself
			statusMsg<="IDLE    "; 
		end
		*/
		131: begin //CALLER
			if (sendCharCaller)
				begin 
				if(charSent>31 & charSent<127)
					begin
					statusMsg<="CALLER  ";
					sentMsg<=sentMsg<<8;
					sentMsg[7:0]<=charSent;
					end				
				else if (charSent == 127)
					begin
					statusMsg<="CALLEE  ";
					end
				else
					begin
					statusMsg<="CALLER  ";
					end
				end
			else
				begin
				statusMsg<="CALLER  ";
				
				end
			end
/*		4: begin //with sendCharCaller and valid charSent
			statusMsg<="CALLER";
			sentMsg<=sentMsg<<8;
			sentMsg[7:0]<=charSent;
			
		end
		5: begin // with sendCharCaller and invalid charSent 
			statusMsg<="CALLER  ";
			
		end
		6: begin // with sendCharCaller and charSent=DEL
			statusMsg<="CALLEE  ";			
		end			*/
		132: begin //CALLEE
			if (sendCharCallee)
				begin 
				if(charSent>31 & charSent<127)
					begin
					statusMsg<="CALLEE  ";
					sentMsg<=sentMsg<<8;
					sentMsg[7:0]<=charSent;
					end				
				else if (charSent == 127)
					begin
					statusMsg<="CALLER  ";
					end
				else
					begin
					statusMsg<="CALLEE  ";
					end
				end
			else
				begin
				statusMsg<="CALLEE  ";
				end
			end
		
/*		8: begin // with sendCharCallee and valid charSent
			statusMsg<="CALLEE  ";
			sentMsg<=sentMsg<<8;
			sentMsg[7:0]<=charSent;
			
		end
		9: begin// with sendCharCallee and invalid charSent
			statusMsg<="CALLEE  ";
		end
		10: begin // with sendCharCallee and charSent=DEL
			statusMsg<="CALLER ";		
		end
		*/
		129: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		128: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		127: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		126: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		125: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		124: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		123: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		122: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		121: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		120: begin
			statusMsg<="COST    ";
			sentMsg<=cost;
			
		end
		119: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
			
		end
		118: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
			
		end
		117: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
			
		end
		116: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
			
		end
		115: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
			//next_state<=114;
		end
		114: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
			//next_state<=113;
		end
		113: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
		//	next_state<=112;
		end
		112: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
		//	next_state<=111;
		end
		111: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
		//	next_state<=110;
		end
		110: begin
			statusMsg<="REJECTED";
//			sentMsg<="";
		//	next_state<=0;
		end
		109: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		108: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		107: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		106: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		105: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		104: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		103: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		102: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		101: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
			
		end
		100: begin
			statusMsg<="RINGING ";
//			sentMsg<="";
		// 	next_state<=0;
			
		end
		default:  begin 
				statusMsg<="DEFAULT ";
				sentMsg<=0;
				end
				
		endcase
		end
	end
	
endmodule

