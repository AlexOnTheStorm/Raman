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

parameter POINTS = 10;
parameter MEASURES = 100;


input clk;
input switch;
input [12*POINTS-1:0] store; //Хранит результаты деления с POINTS точек
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [3:0] cnt_save;
output [12*POINTS*10-1:0] storage;
/*output [12*POINTS-1:0] storage1;
output [12*POINTS-1:0] storage2;
output [12*POINTS-1:0] storage3;
output [12*POINTS-1:0] storage4;
output [12*POINTS-1:0] storage5;
output [12*POINTS-1:0] storage6;
output [12*POINTS-1:0] storage7;
output [12*POINTS-1:0] storage8;
output [12*POINTS-1:0] storage9;
output [12*POINTS-1:0] storage10;*/

reg [12*POINTS*10-1:0] storagefull = 0; //Хранилище 10 последних результатов с POINTS точек

always @(posedge clk)
begin
	if (cnt_measure == 2*POINTS+10 && cnt_point == 0 && !switch)
	begin
		storagefull = {storagefull, store};
	end
end

assign storage = storagefull ;

/*assign storage1 = storagefull [12*POINTS+0*12*POINTS-1 -: 12*POINTS];
assign storage2 = storagefull [12*POINTS+1*12*POINTS-1 -: 12*POINTS];
assign storage3 = storagefull [12*POINTS+2*12*POINTS-1 -: 12*POINTS];
assign storage4 = storagefull [12*POINTS+3*12*POINTS-1 -: 12*POINTS];
assign storage5 = storagefull [12*POINTS+4*12*POINTS-1 -: 12*POINTS];
assign storage6 = storagefull [12*POINTS+5*12*POINTS-1 -: 12*POINTS];
assign storage7 = storagefull [12*POINTS+6*12*POINTS-1 -: 12*POINTS];
assign storage8 = storagefull [12*POINTS+7*12*POINTS-1 -: 12*POINTS];
assign storage9 = storagefull [12*POINTS+8*12*POINTS-1 -: 12*POINTS];
assign storage10 = storagefull [12*POINTS+9*12*POINTS-1 -: 12*POINTS];*/

endmodule