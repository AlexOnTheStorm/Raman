`timescale 1 ns / 10 ps
//Накопление 100000 значений
module Accumulation (
clk,
rdreq,
q,
cnt_point,
cnt_measure,
sum);

parameter POINTS;
parameter MEASURES;

input clk;
input rdreq;
input [11:0] q;
input [10:0] cnt_point;
input [16:0] cnt_measure;
output [29*POINTS-1:0] sum;

reg [29*POINTS-1:0] summary = 1; //Накапливает MEASURES измерений с POINTS точек
reg [29*POINTS-1:0] qreg = 0; //Данные за одно измерение с POINTS точек


always @(posedge clk)
begin
	if (rdreq)
	begin
		qreg = (q << (29*(cnt_point-5)));
		summary = summary + qreg;
	end
	if (cnt_measure == MEASURES-1 && cnt_point == 1)
	summary = 0;
end


assign sum = summary;

endmodule