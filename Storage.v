`timescale 1 ns / 10 ps
//Хранение 10 сумм
module Storage (
clk,
cnt_point,
POINTS,
cnt_save,
ratio_enable,
wr_address,
rd_address,
cnt_ratio,
div_enable,
wren,
cnt_div
);


input clk;
input [10:0] cnt_point;
input [10:0] POINTS;
input [3:0] cnt_save;
input ratio_enable;
input [10:0] cnt_ratio;
input div_enable;
input [10:0] cnt_div;

output reg [14:0] wr_address = 0;
output reg [14:0] rd_address = 0;
output reg wren = 0;



always @(posedge clk)
begin
	
	if (div_enable && cnt_point == POINTS + 100)
	begin
	wren = 1;
	wr_address = (cnt_div)+(cnt_save)*POINTS;
	end
	else
	begin
	wr_address = 0;
	wren = 0;
	end
end

always @(posedge clk)
begin
	if (ratio_enable && cnt_point == POINTS + 10)
	begin
	rd_address = (cnt_ratio)+(cnt_save-1)*POINTS;
	end
	else
	rd_address = 0;
end

endmodule