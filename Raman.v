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
	sum5,
	sum6,
	//sum7,
	cnt_ratio,
	ratio_en,
	ready_ratio
	);
	
	parameter POINTS = 10;
	parameter MEASURES = 100;
	defparam Raman.FirstAction.POINTS = 10;
	defparam Raman.FirstAction.MEASURES = 100;
	defparam Raman.Accum1.POINTS = 10;
	defparam Raman.Accum1.MEASURES = 100;
	defparam Raman.Store1.POINTS = 10;
	defparam Raman.Store1.MEASURES = 100;
	defparam Raman.Pool1.POINTS = 10;
	defparam Raman.Pool1.MEASURES = 100;
	defparam Raman.Switch1.POINTS = 10;
	defparam Raman.Switch1.MEASURES = 100;
	defparam Raman.Ratio1.POINTS = 10;
	defparam Raman.Ratio1.MEASURES = 100;

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
	
	output [11:0] sum1;
	output [11:0] sum2;
	output [11:0] sum3;
	output [11:0] sum5;
	output [11:0] sum6;
	//output [11:0] sum7;
	//output [11:0] sum8;
	//output [4:0] sum9;
	//output sum10;
	
	wire [12*POINTS-1:0] ratio;
	wire [29*POINTS-1:0] sum;
	wire [12*POINTS-1:0] store;
	wire [12*POINTS*10-1:0] storage;
	
	wire [11:0] quotient;

	/*assign sum1 = store [29*10*1-1 -: 29]; //12бит * 100000 измерений (17) * номер участка (POINTS) * ячейка памяти (1-10)
	assign sum2 = store [29*10*2-1 -: 29];
	assign sum3 = store [29*10*3-1 -: 29];
	assign sum4 = store [29*10*4-1 -: 29];
	assign sum5 = store [29*10*5-1 -: 29];
	assign sum6 = store [29*10*6-1 -: 29];
	assign sum7 = store [29*10*7-1 -: 29];
	assign sum8 = store [29*10*8-1 -: 29];
	assign sum9 = store [29*10*9-1 -: 29];
	assign sum10 = store [29*10*10-1 -: 29];*/
	
	/*assign sum1 = sum [29*1-1 -: 29]; //12бит * 100000 измерений (17) * номер участка (POINTS)
	assign sum2 = sum [29*2-1 -: 29];
	assign sum3 = sum [29*3-1 -: 29];
	assign sum4 = sum [29*4-1 -: 29];
	assign sum5 = sum [29*5-1 -: 29];
	assign sum6 = sum [29*6-1 -: 29];
	//assign sum7 = sum [29*7-1 -: 29];
	//assign sum8 = sum [29*8-1 -: 29];
	assign sum9 = sum [29*9-1 -: 29];
	assign sum10 = sum [29*10-1 -: 29];

	
	assign sum9 = quotient;
	assign sum10 = ready;*/

	
	assign sum1 = ratio [12*1+0*12*POINTS-1 -: 12];
	assign sum2 = ratio [12*10+0*12*POINTS-1 -: 12];
	assign sum3 = storage [12*1+0*12*POINTS-1 -: 12];
	assign sum5 = storage [12*2+0*12*POINTS-1 -: 12];
	assign sum6 = storage [12*3+0*12*POINTS-1 -: 12];
	//assign sum7 = store [12*3+0*12*POINTS-1 -: 12];
	//assign sum8 = sum [29*8-1 -: 29];
	//assign sum9 = sum [29*9-1 -: 29];
	//assign sum10 = sum [29*10-1 -: 29];
	
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