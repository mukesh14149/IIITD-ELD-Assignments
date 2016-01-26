`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Comultiplierany: 
// Engineer: 
// 
// Create Date:    16:51:16 11/06/207 
// Design Name: 
// Module Name:    multiplier 
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
module multiplier(product, a, b, multiplicant, multiplier, clk, start, busy);
output [3:0] a, b;			//for monitor purpose
output [7:0] product;		//product result
output busy;					// busy is used for running multiply till one input's multiply is not complete
input [3:0] multiplicant, multiplier;
input clk, start;
reg Q_1;
reg [1:0] counter;				//count upto 16
reg [3:0] A, Q, M;
wire [3:0] sum, difference;	
always @(posedge clk)
		begin
			if (start) begin  //initialise A,Q,M,Q_1,counter with initial inputs and values
				A <= 4'b0;
				Q <= multiplier;
				M <= multiplicant;
				Q_1 <= 1'b0;
				counter <= 4'b0;
			end
			
			else begin
					//when LSB of Q and value of Q_1 is difference then we add A with multiplicant and store it in to A
					// And then we shift A's bit to right and maintain its sign
					//then shift Q's bit to right and replace MSB of Q from LSB of A
					// assign value of Q_1 equal to LSB of Q
					case ({Q[0], Q_1})
         					2'b0_1 :begin 
											   A <= {sum[3], sum[3:1]};
												Q <= {sum[0], Q[3:1]};
												Q_1 <= Q[0];
										 end
         					2'b1_0 : begin 
												A <= {difference[3], difference[3:1]};
												Q <= {difference[0], Q[3:1]};
												Q_1 <= Q[0];
							
											end
								//when LSB of Q and value of Q_1 is same then we only do shift of A, Q, and Q_1
         					default: begin 
												A <= {A[3], A[3:1]};
												Q <= {A[0], Q[3:1]};
												Q_1 <= Q[0];
							
											end
      					endcase

					counter <= counter + 1'b1;
			end
		end
		
assign a = A;
assign b = Q ;
assign sum=A + M ;   //we are adding A + M 
assign difference= A+ ~M + 1'b1;  //we are subtracting A - M
assign product = {A, Q};        //product result 
assign busy = (counter < 4);

initial 
  	begin 
    		$monitor($time,"prod=%b, A=%b, Q=%b, Q_1=%b, M=%d, sum=%d, difference=%d, busy==%b, multiplicant=%b, multiplier=%b, clk=%b, start=%b",
                      product, A, Q, Q_1, M, sum,difference, busy, multiplicant, multiplier, clk, start);
  	end

endmodule
