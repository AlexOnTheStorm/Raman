`timescale 1 ns / 10 ps
//Хранение 10 сумм
module Ratio (
clk,
cnt_measure,
cnt_point,
storage,
switch,
cnt_ratio,
ready_ratio,
ratio_en,
ratio,
one,
two,
three,
eight,
nine,
ten,
quotient);

parameter POINTS = 10;
parameter MEASURES = 100;


input clk;
input switch;
input [12*POINTS*10-1:0] storage; //Хранит результаты деления с POINTS точек
/*input [12*POINTS-1:0] storage1;
input [12*POINTS-1:0] storage2;
input [12*POINTS-1:0] storage3;
input [12*POINTS-1:0] storage4;
input [12*POINTS-1:0] storage5;
input [12*POINTS-1:0] storage6;
input [12*POINTS-1:0] storage7;
input [12*POINTS-1:0] storage8;
input [12*POINTS-1:0] storage9;
input [12*POINTS-1:0] storage10;*/
input [16:0] cnt_measure;
input [10:0] cnt_point;



output reg [10:0] cnt_ratio = 0; //Счетчик очереди на деление
output [12*POINTS-1:0] ratio;

output [11:0] one;
output [11:0] two;
output [11:0] three;
output [11:0] eight;
output [11:0] nine;
output [11:0] ten;

output ready_ratio;
output ratio_en;

reg start = 0;

reg [12*POINTS-1:0] store_ratio = 0; //Хранит результаты деления с POINTS точек
reg ratio_enable = 0;

output [11:0] quotient;

assign ratio = store_ratio;
assign ratio_en = ratio_enable;

assign one = ratio [12*1-1 -: 12];
assign two = ratio [12*2-1 -: 12];
assign three = ratio [12*3-1 -: 12];
assign eight = ratio [12*8-1 -: 12];
assign nine = ratio [12*9-1 -: 12];
assign ten = ratio [12*10-1 -: 12];

reg [15:0] tentimes = 0;

always @(posedge clk)
begin
	if (cnt_measure == 2*POINTS+11 && cnt_point == 0 && !switch)
		ratio_enable = 1;
	if (cnt_ratio > POINTS)
		ratio_enable = 0;
end

always @(posedge clk)
begin
	if (cnt_point == POINTS + 5 && ratio_enable)
	begin
	tentimes = /*storage1 [12*(cnt_ratio+1)-1 -: 12] +
				storage2 [12*(cnt_ratio+1)-1 -: 12] +
				storage3 [12*(cnt_ratio+1)-1 -: 12] +
				storage4 [12*(cnt_ratio+1)-1 -: 12] +
				storage5 [12*(cnt_ratio+1)-1 -: 12] +
				storage6 [12*(cnt_ratio+1)-1 -: 12] +
				storage7 [12*(cnt_ratio+1)-1 -: 12] +
				storage8 [12*(cnt_ratio+1)-1 -: 12] +
				storage9 [12*(cnt_ratio+1)-1 -: 12] +
				storage10 [12*(cnt_ratio+1)-1 -: 12] ;*/
	
				storage [12*(cnt_ratio+1)+0*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+1*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+2*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+3*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+4*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+5*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+6*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+7*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+8*12*POINTS-1 -: 12] +
				storage [12*(cnt_ratio+1)+9*12*POINTS-1 -: 12] ;
	end
end

always @(posedge clk)
begin
	if (cnt_point == POINTS + 10 && ratio_enable)
	start = 1'b1;
	else 
	start = 1'b0;
end

always @(posedge clk)
begin
	if (ratio_enable && cnt_point == POINTS + 20)
	cnt_ratio = cnt_ratio + 1;
	if (!ratio_enable)
	cnt_ratio = 0;
end

always @(posedge clk)
begin
	if (ratio_enable && cnt_point == POINTS + 100)
	store_ratio = {store_ratio, quotient};
	//if (cnt_measure == 2*POINTS+11 && cnt_point == 0)
	//store_ratio = 0;
end

Divider2 Div2 (
				.clk(clk),
				.start(start),
				.divident({{4{1'b0}}, tentimes}),
				.divider({{16{1'b0}}, 4'd10}),
				.quotient(quotient),
				.ready(ready_ratio));

endmodule