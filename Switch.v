`timescale 1 ns / 10 ps
//Управление switch
module Switch (
clk,
cnt_measure,
cnt_point,
POINTS,
MEASURES,
switch
);


input clk;
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [16:0] MEASURES;
input [10:0] POINTS;
output reg switch = 0;


always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1 && cnt_point == 2/*POINTS + 50*/)
	switch = switch + 1; //1 - стокс, 0 - антистокс
end


endmodule