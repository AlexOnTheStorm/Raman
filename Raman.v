// Copyright (C) 1991-2014 Altera Corporation
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
// VERSION		"Version 13.1.4 Build 182 03/12/2014 SJ Web Edition"
// CREATED		"Tue May 29 16:41:23 2018"

module Raman(
	enable,
	clk,
	data,
	clk_out,
	qout
);


input wire	enable;
input wire	clk;
input wire	[11:0] data;
output wire	clk_out;
output wire	[11:0] qout;

wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_2;
wire	[11:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[11:0] SYNTHESIZED_WIRE_6;
wire	[14:0] SYNTHESIZED_WIRE_7;
wire	[14:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[10:0] SYNTHESIZED_WIRE_11;
wire	[11:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_15;
wire	[28:0] SYNTHESIZED_WIRE_16;
wire	[10:0] SYNTHESIZED_WIRE_17;
wire	[10:0] SYNTHESIZED_WIRE_67;
wire	[16:0] SYNTHESIZED_WIRE_68;
wire	[10:0] SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_22;
wire	[28:0] SYNTHESIZED_WIRE_70;
wire	[10:0] SYNTHESIZED_WIRE_71;
wire	[10:0] SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_27;
wire	[16:0] SYNTHESIZED_WIRE_73;
wire	[11:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_74;
wire	[28:0] SYNTHESIZED_WIRE_46;
wire	[28:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_49;
wire	[3:0] SYNTHESIZED_WIRE_52;
wire	[11:0] SYNTHESIZED_WIRE_59;

assign	clk_out = SYNTHESIZED_WIRE_65;




FIFORam	b2v_inst(
	
	.clock(SYNTHESIZED_WIRE_65),
	.rdreq(SYNTHESIZED_WIRE_66),
	
	.wrreq(SYNTHESIZED_WIRE_2),
	.data(SYNTHESIZED_WIRE_3),
	
	
	.q(SYNTHESIZED_WIRE_38)
	);


MEASURES	b2v_inst1(
	.result(SYNTHESIZED_WIRE_68));


Receiver	b2v_inst10(
	
	.data_plus(data),
	.data_in(SYNTHESIZED_WIRE_3));


Memory2port	b2v_inst11(
	.wren(SYNTHESIZED_WIRE_4),
	.clock(SYNTHESIZED_WIRE_65),
	.data(SYNTHESIZED_WIRE_6),
	.rdaddress(SYNTHESIZED_WIRE_7),
	.wraddress(SYNTHESIZED_WIRE_8),
	.q(SYNTHESIZED_WIRE_59));


Temperature	b2v_inst14(
	.wren(SYNTHESIZED_WIRE_9),
	.clock(SYNTHESIZED_WIRE_65),
	.address(SYNTHESIZED_WIRE_11),
	.data(SYNTHESIZED_WIRE_12),
	.q(qout));


Summary2port	b2v_inst18(
	.wren(SYNTHESIZED_WIRE_13),
	.clock(SYNTHESIZED_WIRE_65),
	.aclr(SYNTHESIZED_WIRE_15),
	.data(SYNTHESIZED_WIRE_16),
	.rdaddress(SYNTHESIZED_WIRE_17),
	.wraddress(SYNTHESIZED_WIRE_67),
	.q(SYNTHESIZED_WIRE_70));


Action	b2v_inst2(
	.enable(enable),
	.clk(SYNTHESIZED_WIRE_65),
	.MEASURES(SYNTHESIZED_WIRE_68),
	.POINTS(SYNTHESIZED_WIRE_69),
	.wrreq(SYNTHESIZED_WIRE_2),
	.rdreq(SYNTHESIZED_WIRE_66),
	.cnt_measure(SYNTHESIZED_WIRE_73),
	.cnt_point(SYNTHESIZED_WIRE_67));


Stokes2port	b2v_inst21(
	.wren(SYNTHESIZED_WIRE_22),
	.clock(SYNTHESIZED_WIRE_65),
	.data(SYNTHESIZED_WIRE_70),
	.rdaddress(SYNTHESIZED_WIRE_71),
	.wraddress(SYNTHESIZED_WIRE_72),
	.q(SYNTHESIZED_WIRE_47));


Antistokes2port	b2v_inst22(
	.wren(SYNTHESIZED_WIRE_27),
	.clock(SYNTHESIZED_WIRE_65),
	.data(SYNTHESIZED_WIRE_70),
	.rdaddress(SYNTHESIZED_WIRE_71),
	.wraddress(SYNTHESIZED_WIRE_72),
	.q(SYNTHESIZED_WIRE_46));


Accumulation	b2v_inst3(
	.clk(SYNTHESIZED_WIRE_65),
	.rdreq(SYNTHESIZED_WIRE_66),
	.cnt_measure(SYNTHESIZED_WIRE_73),
	.cnt_point(SYNTHESIZED_WIRE_67),
	.MEASURES(SYNTHESIZED_WIRE_68),
	.POINTS(SYNTHESIZED_WIRE_69),
	.q(SYNTHESIZED_WIRE_38),
	.qmem(SYNTHESIZED_WIRE_70),
	.aclr(SYNTHESIZED_WIRE_15),
	.wren(SYNTHESIZED_WIRE_13),
	.cnt_point_read(SYNTHESIZED_WIRE_17),
	.datamem(SYNTHESIZED_WIRE_16));


Pool	b2v_inst4(
	.clk(SYNTHESIZED_WIRE_65),
	.switch(SYNTHESIZED_WIRE_74),
	.cnt_measure(SYNTHESIZED_WIRE_73),
	.cnt_point(SYNTHESIZED_WIRE_67),
	.MEASURES(SYNTHESIZED_WIRE_68),
	.POINTS(SYNTHESIZED_WIRE_69),
	.qantistokes(SYNTHESIZED_WIRE_46),
	.qstokes(SYNTHESIZED_WIRE_47),
	.div_enable(SYNTHESIZED_WIRE_49),
	
	
	.wren_stokes(SYNTHESIZED_WIRE_22),
	.wren_antistokes(SYNTHESIZED_WIRE_27),
	.address(SYNTHESIZED_WIRE_72),
	.cnt_div(SYNTHESIZED_WIRE_71),
	.cnt_save(SYNTHESIZED_WIRE_52),
	.quotient(SYNTHESIZED_WIRE_6));


Storage	b2v_inst5(
	.clk(SYNTHESIZED_WIRE_65),
	
	.div_enable(SYNTHESIZED_WIRE_49),
	.cnt_div(SYNTHESIZED_WIRE_71),
	.cnt_point(SYNTHESIZED_WIRE_67),
	
	.cnt_save(SYNTHESIZED_WIRE_52),
	.POINTS(SYNTHESIZED_WIRE_69),
	.wren(SYNTHESIZED_WIRE_4),
	.rd_address(SYNTHESIZED_WIRE_7),
	.wr_address(SYNTHESIZED_WIRE_8));


Ratio	b2v_inst6(
	.clk(SYNTHESIZED_WIRE_65),
	.switch(SYNTHESIZED_WIRE_74),
	.cnt_measure(SYNTHESIZED_WIRE_73),
	.cnt_point(SYNTHESIZED_WIRE_67),
	.POINTS(SYNTHESIZED_WIRE_69),
	.qmem(SYNTHESIZED_WIRE_59),
	
	
	
	.wren(SYNTHESIZED_WIRE_9),
	.cnt_ratio(SYNTHESIZED_WIRE_11),
	.quotient(SYNTHESIZED_WIRE_12)
	);


Switch	b2v_inst7(
	.clk(SYNTHESIZED_WIRE_65),
	.cnt_measure(SYNTHESIZED_WIRE_73),
	.cnt_point(SYNTHESIZED_WIRE_67),
	.MEASURES(SYNTHESIZED_WIRE_68),
	.POINTS(SYNTHESIZED_WIRE_69),
	.switch(SYNTHESIZED_WIRE_74));


POINTS	b2v_inst8(
	.result(SYNTHESIZED_WIRE_69));


PLL	b2v_inst9(
	.inclk0(clk),
	
	.c0(SYNTHESIZED_WIRE_65)
	);


endmodule
