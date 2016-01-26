`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:11 10/30/2015 
// Design Name: 
// Module Name:    enqr_try 
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
module enqr_try(q, v, d);
    output [2:0] q; 			
    output       v;			//"v" is a valid Indicator, it become HIGH only when at least one input is active. 
    input  [7:0] d;
    reg    [2:0] q;

    assign v= |d; 			
    always @ (d)
    begin
			if(d[7]) 
					q=7; 
			else	if(d[6]) 
					q=6; 
			else	if(d[5]) 
					q=5; 
			else	if(d[4]) 
					q=4; 
			else	if(d[3]) 
					q=3; 
			else	if(d[2]) 
					q=2; 
			else	if(d[1]) 
					q=1; 
			else	if(d[0]) 
					q=0; 
			else
					q=3'bx;
    end
     endmodule