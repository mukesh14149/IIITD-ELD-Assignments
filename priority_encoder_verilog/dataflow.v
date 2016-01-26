`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:13 10/30/2015
// Design Name:    
// Module Name:    dataflow
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
module dataflow(Q1,Q0,D2,D1,D0);
input D2,D1,D0;
output Q1,Q0;

assign Q0 = (!D2&&!D1&&D0)|| D2;
assign Q1 = (!D2&&D1)|| D2;

endmodule
