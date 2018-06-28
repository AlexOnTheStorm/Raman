`timescale 1 ns / 10 ps

module Receiver (
	input [11:0] data_plus,
	input [11:0] data_minus,
	output [11:0] data_in
	);
	
	reg [11:0] data_minus_reg = 0;
	
	wire signed [12:0] lol;
	assign lol = data_plus - data_minus_reg;
	assign data_in = lol [12] ? -lol : lol;
	
	
	endmodule