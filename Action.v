`timescale 1 ns / 10 ps
//Модуль ожидает синхросигнал, дает сигнал на запись и считывание данных, запускает счетчики
module Action (
enable,
wrreq,
rdreq,
clk,
POINTS,
MEASURES,
cnt_point,
cnt_measure);

input enable;
input clk;
input [10:0] POINTS;
input [16:0] MEASURES;

output reg wrreq = 0;
output reg rdreq = 0;
output reg [10:0] cnt_point = 0;
output reg [16:0] cnt_measure = 0/*MEASURES-1*/; //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


always @(posedge clk)
begin
	if (cnt_point >= 0 && cnt_point <= POINTS && !enable)
	wrreq <= 1'b1;
	else
	wrreq <= 1'b0;
end

always @(posedge clk)
begin
	if (cnt_point >= 3 && cnt_point <= POINTS + 3 && cnt_measure < MEASURES /*&& cnt_measure > 0*/)
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



endmodule