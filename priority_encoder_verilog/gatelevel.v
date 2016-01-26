`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:13 10/30/2015
// Design Name:    
// Module Name:    gatelevel 
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
module gatelevel(Q1,Q0,D2,D1,D0);
input D2,D1,D0;
output Q1,Q0;

not n1(A,D2);		//Where A is the wire between the NOT gate and OR gate
not n2(B,D1); 		//Where b is the wire between the NOT gate and OR gate
and n3(C,A,B);		//C is the output of the OR gate with A and B as inputs 
and n4(D,C,D0);	//D is the output of the OR gate and goes into the AND gate
or n5(Q0,D,D2);
not n6(E,D2);
and n7(F,D1,E);
or n8(Q1,F,D2);

endmodule
