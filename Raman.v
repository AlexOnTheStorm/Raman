// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Fri Mar 23 19:06:47 2018"

module Raman(
	enable,
	clk,
	data,
	switch,
	eight,
	nine,
	one,
	ten,
	three,
	two
);


input wire	enable;
input wire	clk;
input wire	[11:0] data;
output wire	switch;
output wire	[11:0] eight;
output wire	[11:0] nine;
output wire	[11:0] one;
output wire	[11:0] ten;
output wire	[11:0] three;
output wire	[11:0] two;

wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_1;
wire	[16:0] SYNTHESIZED_WIRE_21;
wire	[10:0] SYNTHESIZED_WIRE_22;
wire	[11:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_23;
wire	[289:0] SYNTHESIZED_WIRE_9;
wire	[119:0] SYNTHESIZED_WIRE_13;
wire	[1199:0] SYNTHESIZED_WIRE_17;

assign	switch = SYNTHESIZED_WIRE_23;




FIFORam	b2v_inst(
	
	.clock(clk),
	.rdreq(SYNTHESIZED_WIRE_20),
	
	.wrreq(SYNTHESIZED_WIRE_1),
	.data(data),
	
	
	.q(SYNTHESIZED_WIRE_5)
	);


Action	b2v_inst2(
	.enable(enable),
	.clk(clk),
	.wrreq(SYNTHESIZED_WIRE_1),
	.rdreq(SYNTHESIZED_WIRE_20),
	.cnt_measure(SYNTHESIZED_WIRE_21),
	.cnt_point(SYNTHESIZED_WIRE_22)
	);
	defparam	b2v_inst2.MEASURES = 100;
	defparam	b2v_inst2.POINTS = 10;


Accumulation	b2v_inst3(
	.clk(clk),
	.rdreq(SYNTHESIZED_WIRE_20),
	.cnt_measure(SYNTHESIZED_WIRE_21),
	.cnt_point(SYNTHESIZED_WIRE_22),
	.q(SYNTHESIZED_WIRE_5),
	
	.sum(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst3.MEASURES = 100;
	defparam	b2v_inst3.POINTS = 10;


Pool	b2v_inst4(
	.clk(clk),
	.switch(SYNTHESIZED_WIRE_23),
	.cnt_measure(SYNTHESIZED_WIRE_21),
	.cnt_point(SYNTHESIZED_WIRE_22),
	
	.sum(SYNTHESIZED_WIRE_9),
	
	
	
	
	.store(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst4.MEASURES = 100;
	defparam	b2v_inst4.POINTS = 10;


Storage	b2v_inst5(
	.clk(clk),
	.switch(SYNTHESIZED_WIRE_23),
	.cnt_measure(SYNTHESIZED_WIRE_21),
	.cnt_point(SYNTHESIZED_WIRE_22),
	
	.store(SYNTHESIZED_WIRE_13),
	.storage(SYNTHESIZED_WIRE_17));
	defparam	b2v_inst5.MEASURES = 100;
	defparam	b2v_inst5.POINTS = 10;


Ratio	b2v_inst6(
	.clk(clk),
	.switch(SYNTHESIZED_WIRE_23),
	.cnt_measure(SYNTHESIZED_WIRE_21),
	.cnt_point(SYNTHESIZED_WIRE_22),
	.storage(SYNTHESIZED_WIRE_17),
	
	
	
	.eight(eight),
	.nine(nine),
	.one(one),
	
	.ten(ten),
	.three(three),
	.two(two));
	defparam	b2v_inst6.MEASURES = 100;
	defparam	b2v_inst6.POINTS = 10;


Switch	b2v_inst7(
	.clk(clk),
	.cnt_measure(SYNTHESIZED_WIRE_21),
	.cnt_point(SYNTHESIZED_WIRE_22),
	
	.switch(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst7.MEASURES = 100;
	defparam	b2v_inst7.POINTS = 10;


endmodule
