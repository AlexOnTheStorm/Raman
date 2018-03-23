`timescale 1 ns / 10 ps

module Raman (
	clock,
	data,
	rdreq,
	wrreq,
	q,
	cnt_point,
	cnt_measure,
	cnt_save,
	cnt_div,
	enable,
	switch,
	ready,
	div_en,
	
	sum1,
	sum2,
	sum3,
	sum4,
	sum5,
	
	ratio1,
	ratio2,
	ratio3,
	ratio4,
	ratio5,
	
	store1,
	store2,
	store3,
	store4,
	store5,
	store6,
	store7,
	store8,
	store9,
	store10,
	
	quotient,
	cnt_ratio,
	ratio_en,
	ready_ratio
	);
	
	parameter POINTS = 10;
	parameter MEASURES = 100;
	
	defparam 
	Raman.FirstAction.POINTS = 10,
	Raman.FirstAction.MEASURES = 100,
	 Raman.Accum1.POINTS = 10,
	 Raman.Accum1.MEASURES = 100,
	 Raman.Store1.POINTS = 10,
	 Raman.Store1.MEASURES = 100,
	 Raman.Pool1.POINTS = 10,
	 Raman.Pool1.MEASURES = 100,
	 Raman.Switch1.POINTS = 10,
	 Raman.Switch1.MEASURES = 100,
	 Raman.Ratio1.POINTS = 10,
	 Raman.Ratio1.MEASURES = 100;

	input	  clock;
	input	[11:0]  data;
	input enable;
	output	  rdreq;
	output	  wrreq;
	output	[11:0]  q;
	output [10:0] cnt_point;
	output [16:0] cnt_measure;
	output [3:0] cnt_save;
	
	output switch;
	
	output [10:0] cnt_div;
	output ready;
	output div_en;
	
	output [10:0] cnt_ratio;
	output ratio_en;
	output ready_ratio;
	
	output [29:0] sum1;
	output [29:0] sum2;
	output [29:0] sum3;
	output [29:0] sum4;
	output [29:0] sum5;
	
	output [11:0] ratio1;
	output [11:0] ratio2;
	output [11:0] ratio3;
	output [11:0] ratio4;
	output [11:0] ratio5;
	
	output [11:0] store1;
	output [11:0] store2;
	output [11:0] store3;
	output [11:0] store4;
	output [11:0] store5;
	output [11:0] store6;
	output [11:0] store7;
	output [11:0] store8;
	output [11:0] store9;
	output [11:0] store10;

	wire [12*POINTS-1:0] ratio;
	wire [29*POINTS-1:0] sum;
	wire [12*POINTS-1:0] store;
	wire [12*POINTS*10-1:0] storage;
	
	
	output [11:0] quotient;

	
	assign ratio1 = ratio [12*1-1 -: 12];
	assign ratio2 = ratio [12*2-1 -: 12];
	assign ratio3 = ratio [12*(POINTS-2)-1 -: 12];
	assign ratio4 = ratio [12*(POINTS-1)-1 -: 12];
	assign ratio5 = ratio [12*POINTS-1 -: 12];
	
	assign sum1 = sum [29*1-1 -: 29];
	assign sum2 = sum [29*2-1 -: 29];
	assign sum3 = sum [29*3-1 -: 29];
	assign sum4 = sum [29*4-1 -: 29];
	assign sum5 = sum [29*5-1 -: 29];
	
	assign store1 = storage [12*10+0*12*POINTS-1 -: 12];
	assign store2 = storage [12*10+1*12*POINTS-1 -: 12];
	assign store3 = storage [12*10+2*12*POINTS-1 -: 12];
	assign store4 = storage [12*10+3*12*POINTS-1 -: 12];
	assign store5 = storage [12*10+4*12*POINTS-1 -: 12];
	assign store6 = storage [12*10+5*12*POINTS-1 -: 12];
	assign store7 = storage [12*10+6*12*POINTS-1 -: 12];
	assign store8 = storage [12*10+7*12*POINTS-1 -: 12];
	assign store9 = storage [12*10+8*12*POINTS-1 -: 12];
	assign store10 = storage [12*10+9*12*POINTS-1 -: 12];
	
	
	Action FirstAction  (
				.enable(enable),
				.wrreq(wrreq),
				.rdreq(rdreq),
				.clk(clock),
				.cnt_point(cnt_point),
				.cnt_measure(cnt_measure),
				.cnt_save(cnt_save));
				

	FIFORam	Ram (
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.rdreq (rdreq),
				.q (q));

				
	Accumulation Accum1 (
				.clk(clock),
				.rdreq(rdreq),
				.cnt_point(cnt_point),
				.cnt_measure(cnt_measure),
				.q(q),
				.sum(sum));
				
	Pool Pool1 (
				.clk(clock),
				.cnt_measure(cnt_measure),
				.cnt_point(cnt_point),
				.cnt_save(cnt_save),
				.sum(sum),
				.store(store),
				.ready(ready),
				.cnt_div(cnt_div),
				.div_en(div_en),
				.switch(switch));
				
	Storage Store1 (
				.clk(clock),
				.cnt_measure(cnt_measure),
				.store(store),
				.storage(storage),
				.switch(switch),
				.cnt_point(cnt_point),
				.cnt_save(cnt_save));
				
				
	Ratio Ratio1 (
				.clk(clock),
				.cnt_measure(cnt_measure),
				.cnt_point(cnt_point),
				.storage(storage),
				.switch(switch),
				.cnt_ratio(cnt_ratio),
				.ready_ratio(ready_ratio),
				.ratio_en(ratio_en),
				.ratio(ratio),
				.quotient(quotient));
				
	Switch Switch1 (
				.clk(clock),
				.cnt_measure(cnt_measure),
				.cnt_point(cnt_point),
				.cnt_save(cnt_save),
				.switch(switch));
	
endmodule