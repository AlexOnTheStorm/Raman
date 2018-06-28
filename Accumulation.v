`timescale 1 ns / 10 ps
//Накопление 100000 значений
module Accumulation (
clk,
//rdreq,
q,
qmem,
datamem,
POINTS,
MEASURES,
cnt_point,
cnt_measure,
aclr,
cnt_point_read,
wren,
rdreq
);



input clk;
//input rdreq;
input [11:0] q;
input [28:0] qmem;
input [10:0] POINTS;
input [16:0] MEASURES;
input [10:0] cnt_point;
input [16:0] cnt_measure;
output [28:0] datamem;
output reg aclr = 0;
output [10:0] cnt_point_read;
input rdreq;
output reg wren = 0;

assign datamem = aclr ? 0 : qmem + q;
assign cnt_point_read = cnt_point + 2;

always @(posedge clk)
begin
	if (cnt_measure == 0 /*&& cnt_point == 1*/)
	aclr = 1;
	else
	aclr = 0;
end

always @(posedge clk)
begin
	if (1)
	wren <= rdreq;
	else 
	wren <= 0;
end

endmodule