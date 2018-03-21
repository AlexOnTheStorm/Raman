`timescale 1 ns / 10 ps
//Хранение 10 сумм
module Storage (
clk,
cnt_measure,
cnt_point,
cnt_save,
store,
storage,
switch);

parameter POINTS;
parameter MEASURES;

input clk;
input switch;
input [12*POINTS-1:0] store; //Хранит результаты деления с POINTS точек
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [3:0] cnt_save;
output [12*POINTS*10-1:0] storage;

reg [12*POINTS*10-1:0] storagefull = 0; //Хранилище 10 последних результатов с POINTS точек

always @(posedge clk)
begin
	if (cnt_measure == 2*POINTS+10 && cnt_point == 0 && !switch)
	begin
		storagefull = {storagefull, store};
	end
end

assign storage = storagefull;

endmodule