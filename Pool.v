`timescale 1 ns / 10 ps
//Хранилище для делителя
module Pool (
clk,
cnt_measure,
cnt_point,
cnt_save,
sum,
store,
ready,
cnt_div,
div_en,
switch,
prestore);

parameter POINTS = 10;
parameter MEASURES = 100;


input clk;
input [29*POINTS-1:0] sum; // MEASURES измерений с POINTS точек
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [3:0] cnt_save;
input switch;

output reg [10:0] cnt_div = 0; //Счетчик очереди на деление
output [12*POINTS-1:0] store;

output [11:0] prestore;

output ready;
output div_en;

reg [29*POINTS-1:0] stokes = 0;
reg [29*POINTS-1:0] antistokes = 0;

reg start = 0;
wire [11:0] quotient; //Результат деления одной точки
reg [12*POINTS-1:0] storereg; //Хранит результаты деления с POINTS точек
reg div_enable = 0;

assign store = storereg;

assign prestore = store [12*10-1 -: 12];

assign div_en = div_enable;

always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1 && cnt_point == 0)
	begin
	if (switch)
		antistokes = sum; //Временное хранилище MEASURES измерений с POINTS точек, пока они в очереди на деление
	else
		stokes = sum;
	end
end

always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1 && cnt_point == 0 && !switch)
		div_enable = 1;
	if (cnt_div > POINTS)
		div_enable = 0;
end

always @(posedge clk)
begin
	if (cnt_point == POINTS + 10 && div_enable && antistokes && stokes)
	start = 1'b1;
	else 
	start = 1'b0;
end

always @(posedge clk)
begin
	if (div_enable && cnt_point == POINTS + 20)
	cnt_div = cnt_div + 1;
	if (!div_enable)
	cnt_div = 0;
end

always @(posedge clk)
begin
	if (div_enable && cnt_point == POINTS + 100)
	storereg = {storereg, quotient};
	if (cnt_measure == MEASURES-1 && cnt_point == 0)
	storereg = 0;
end

Divider Div1 (
				.clk(clk),
				.start(start),
				.divident({{29{1'b0}}, {stokes [29*(cnt_div+1)-1 -: 29], 6'b0} }),
				.divider({{35{1'b0}}, antistokes [29*(cnt_div+1)-1 -: 29] }),
				.quotient(quotient),
				.ready(ready));

endmodule