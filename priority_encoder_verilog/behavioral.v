`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:16 10/30/2015 
// Design Name:    
// Module Name:    behavioral 
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
module behavioral(Q1,Q0,D2,D1,D0);
input D2,D1,D0; 
output Q1,Q0;
reg Q1,Q0;

always@(D0 or D1 or D2)
if(D2 == 1)
	begin 
		Q1 = 1;
		Q0 = 1;
	end
else if(D1 == 1)
	begin 
		Q1 = 1;
		Q0 = 0;
	end
else if(D0 == 1)
		begin 
			Q1 = 0;
			Q0 = 1;
		end 
else
		begin 
			Q1 = 0;
			Q0 = 0;
		end

endmodule
