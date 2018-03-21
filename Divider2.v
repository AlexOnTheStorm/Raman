`timescale 1 ns / 10 ps
//Усреднение 100000 измерений
module Divider2
    #(parameter N = 20)
    (
    input       wire                    clk,
    input       wire                    start,
    input       wire    [ N-1 :  0 ]    divident,
    input       wire    [ N-1 :  0 ]    divider,
    output      wire    [ N-1 :  0 ]    quotient,
    output      wire    [ N-1 :  0 ]    reminder,
    output      wire                    ready
    );

localparam M = 2*N;

reg     signed  [ N-1 :  0 ] r_quotient = {N{1'b0}};
assign quotient = r_quotient;

reg     signed  [ M-1 :  0 ] divident_copy = {M{1'b0}};
reg     signed  [ M-1 :  0 ] divider_copy = {M{1'b0}};

wire    signed  [ M-1 :  0 ] w_diff = divident_copy - divider_copy;
reg             [   4 :  0 ] cnt = 5'b0;

assign reminder = divident_copy[N-1:0];
assign ready = cnt == 0;


always@(posedge clk)
if(start)
begin
    cnt <= 5'd20;
    r_quotient <= {N{1'b0}};
    divident_copy <= {{N{1'b0}}, divident};
    divider_copy <= {1'b0, divider, {N-1{1'b0}}};
end
else if (!ready)
begin
    cnt <= cnt - 1'b1;
    divider_copy <= divider_copy >> 1;
    if(!w_diff[39])
    begin
        divident_copy <= w_diff;
        r_quotient <= {quotient[18:0], 1'b1};
    end
    else
    begin
        r_quotient <= {quotient[18:0], 1'b0};
    end
end

endmodule
