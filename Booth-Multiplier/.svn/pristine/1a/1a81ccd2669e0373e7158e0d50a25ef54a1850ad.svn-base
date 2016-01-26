`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:03:04 11/06/207
// Design Name:   multiplier
// Module Name:   /home/mukesh/xilinx/multiplier/test.v
// Project Name:  multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier
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
	reg [3:0] multiplicant;
	reg [3:0] multiplier;
	reg clk;
	reg start;

	// Outputs
	wire [7:0] product;
	wire [3:0] a;
	wire [3:0] b;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	multiplier uut (
		.product(product), 
		.a(a), 
		.b(b), 
		.multiplicant(multiplicant), 
		.multiplier(multiplier), 
		.clk(clk), 
		.start(start), 
		.busy(busy)
	);

	initial begin
		// Initialize Inputs
		multiplicant = 0;
		multiplier = 0;
		clk = 0;
		start = 0;

		multiplicant = 3;
		multiplier = 1;
		start = 1;
		#50 start = 0;
		#40 $display("-------------------------------------------");
		multiplicant = 3;
		multiplier = 4;
		start = 1;
		#50 start = 0;
		#40 $display("-------------------------------------------");
		// Wait 100 ns for global reset to finish
		
        $finish;
		// Add stimulus here

	end
     always #5 clk = !clk; 
	  always @(posedge clk) $strobe("product: %d busy: %d at time=%t", product, busy, $stime);
endmodule

