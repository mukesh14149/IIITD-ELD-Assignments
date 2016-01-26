`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:16 10/30/2015
// Design Name:   ten
// Module Name:   C:/Users/RAVITEJA/ten/test.v
// Project Name:  ten
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Priorityif
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg D2;
	reg D1;
	reg D0;

	// Outputs
	wire Q1;
	wire Q0;

	// Instantiate the Unit Under Test (UUT)
	ten uut (
		.Q1(Q1), 
		.Q0(Q0), 
		.D2(D2), 
		.D1(D1), 
		.D0(D0)
	);

	initial begin
		// Initialize Inputs
		D2 = 0;
		D1 = 0;
		D0 = 0;

		// Wait 100 ns for global reset to finish
		
		#10 D0 = 0;D1 = 0;D2 = 0;
		#10 D0 = 0;D1 = 0;D2 = 1;
		#10 D0 = 0;D1 = 1;D2 = 0;
		#10 D0 = 0;D1 = 1;D2 = 1;
		#10 D0 = 1;D1 = 0;D2 = 0;
		#10 D0 = 1;D1 = 0;D2 = 1;
		#10 D0 = 1;D1 = 1;D2 = 0;
		#10 D0 = 1;D1 = 1;D2 = 1;


	end
      
endmodule
