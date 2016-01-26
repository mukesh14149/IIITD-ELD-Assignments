`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:44:15 10/30/2015
// Design Name:   enqr_try
// Module Name:   /home/mukesh/xilinx/Assignment9/testing.v
// Project Name:  Assignment9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: enqr_try
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testing;

	// Inputs
	reg [7:0] d;

	// Outputs
	wire [2:0] q;
	wire v;

	// Instantiate the Unit Under Test (UUT)
	enqr_try uut (
		.q(q), 
		.v(v), 
		.d(d)
	);

	
	     
		initial begin
		// Initialize Inputs
		d = 0;

		// Wait 100 ns for global reset to finish
		#100;			
	// Add stimulus here

	end
	 always begin
				d = $random % 8;		//randomly generate values for input d
				#100;
		end
endmodule
