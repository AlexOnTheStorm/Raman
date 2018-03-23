`timescale 1 ns / 10 ps
//Управление switch
module Switch (
clk,
cnt_measure,
cnt_point,
cnt_save,
switch,
);

parameter POINTS = 10;
parameter MEASURES = 100;


input clk;
input [16:0] cnt_measure;
input [10:0] cnt_point;
input [3:0] cnt_save;
output switch;

reg switch_reg = 0;

assign switch = switch_reg;


always @(posedge clk)
begin
	if (cnt_measure == MEASURES-1 && cnt_point == POINTS + 50)
	switch_reg = switch_reg + 1; //1 - стокс, 0 - антистокс
end


endmodule