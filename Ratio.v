//`include "util/array_pack_unpack.v"

`timescale 1 ns / 10 ps
//Хранение 10 сумм
module Ratio (
clk,
cnt_measure,
cnt_point,
switch,
POINTS,
cnt_ratio,
ready,
ratio_enable,
quotient,
start,
tentimes,
qmem,
wren
);



input clk;
input switch;
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [10:0] POINTS;
input [11:0] qmem;

output reg [10:0] cnt_ratio = 0; //Счетчик очереди на деление
output ready;
output reg ratio_enable = 0;
output [11:0] quotient;
output reg start = 0;
output reg [15:0] tentimes = 0;
output reg wren = 0;


always @(posedge clk)
begin
	if (cnt_measure == 2*POINTS+11 && cnt_point == 0 && !switch)
		ratio_enable = 1;
	if (cnt_ratio > POINTS)
		ratio_enable = 0;
end

always @(posedge clk)
begin
	if (cnt_point >= POINTS && ratio_enable && cnt_point <= POINTS+9)
	begin
	tentimes = tentimes + qmem;
	end
	if (cnt_point == POINTS + 200 && ratio_enable)
	tentimes = 0;
end

always @(posedge clk)
begin
	if (cnt_point == POINTS + 10 && ratio_enable && cnt_ratio <= POINTS)
	start = 1'b1;
	else 
	start = 1'b0;
end

always @(posedge clk)
begin
	if (ratio_enable && cnt_point == POINTS + 8)
	cnt_ratio = cnt_ratio + 1;
	if (!ratio_enable)
	cnt_ratio = 0;
end


always @(posedge clk)
begin
	if (ratio_enable && cnt_point == POINTS + 200)
	begin
	wren = 1;
	end
	else
	wren = 0;
end


/*
Divider2 Div2 (
				.clk(clk),
				.start(start),
				.divident({{4{1'b0}}, tentimes}),
				.divider({{16{1'b0}}, 4'd10}),
				.quotient(quotient),
				.ready(ready));
				*/
LPM_DIV2 Div3 (
				.denom(4'd10),
				.numer(tentimes),
				.quotient(quotient),
				.clock(clk),
				.clken(start)
				);

endmodule