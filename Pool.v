`timescale 1 ns / 10 ps
//Хранилище для делителя
module Pool (
clk,
cnt_measure,
cnt_point,
MEASURES,
POINTS,
cnt_save,
cnt_div,
div_enable,
switch,
address,
start,
qstokes,
qantistokes,
ready,
quotient,
wren_stokes,
wren_antistokes
);


input clk;
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [16:0] MEASURES;
input [10:0] POINTS;
input switch;
input [28:0] qstokes;
input [28:0] qantistokes;

output reg [10:0] cnt_div = 0; //Счетчик очереди на деление
output reg div_enable = 0;
output reg [10:0] address = 0;
output reg start = 0;
output reg [3:0] cnt_save = 0;
output ready;
output [11:0] quotient;
output reg wren_antistokes = 0;
output reg wren_stokes = 0;






always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1)
	begin
	address = cnt_point-3;
	wren_stokes = switch;
	wren_antistokes = !switch;
	end
	else
	begin
		wren_stokes = 0;
		wren_antistokes = 0;
	end
	/*else if (div_enable)
	address = cnt_div + 1;*/
end



always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1 && cnt_point == 0 && !switch /*&& cnt_save > 0*/)
		div_enable = 1;
	if (cnt_div > POINTS)
		div_enable = 0;
end

always @(posedge clk)
begin
	if (cnt_point == POINTS + 10 && div_enable /*&& antistokes && stokes*/)
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
	if (cnt_div == POINTS+1 && cnt_point == POINTS + 20)
	cnt_save = cnt_save + 1;
	if (cnt_save > 9)
	cnt_save = 0;
end

/*always @(posedge clk)
begin
	if (div_enable && cnt_point == POINTS + 100)
	storereg = {storereg, quotient};
	if (cnt_measure == MEASURES-1 && cnt_point == 0)
	storereg = 0;
end
*/

/*
Divider Div1 (
				.clk(clk),
				.start(start),
				.divident({{29{1'b0}}, {qstokes, 6'b0} }),
				.divider({{35{1'b0}}, qantistokes }),
				.quotient(quotient),
				.ready(ready));
*/
LPM_DIV Div2 (
				.denom(qantistokes),
				.numer({qstokes, 6'b0}),
				.quotient(quotient),
				.clock(clk),
				.clken(start)
				);

endmodule