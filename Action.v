`timescale 1 ns / 10 ps
//Модуль ожидает синхросигнал, дает сигнал на запись и считывание данных, запускает счетчики
module Action (
enable,
wrreq,
rdreq,
clk,
cnt_point,
cnt_measure,
cnt_save);

input enable;
input clk;
output reg wrreq;
output reg rdreq;
output reg [10:0] cnt_point;
output reg [16:0] cnt_measure;
output reg [3:0] cnt_save;

parameter POINTS = 10;
parameter MEASURES = 100;

initial
begin
	wrreq = 0;
	rdreq = 0;
	cnt_point = 0;
	cnt_measure = MEASURES-1;
	cnt_save = 9;
end

always @(posedge clk)
begin
	if (cnt_point >= 0 && cnt_point <= POINTS && !enable)
	wrreq <= 1'b1;
	else
	wrreq <= 1'b0;
end

always @(posedge clk)
begin
	if (cnt_point >= 3 && cnt_point <= POINTS + 3)
	rdreq <= 1'b1;
	else
	rdreq <= 1'b0;
end

always @(posedge clk)
begin
	if (enable)
	cnt_point <= 0;
	else
	cnt_point <= cnt_point + 1;
end

always @(posedge clk)
begin
	if (cnt_measure >= MEASURES)
	cnt_measure <= 0;
	else if (cnt_point == 1)
	cnt_measure <= cnt_measure + 1;
	
end

always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1 && cnt_point == 0 && !enable)
	cnt_save <= cnt_save + 1;
	if (cnt_save > 9)
	cnt_save <= 0;
end



endmodule