`timescale 1 ns/10 ps

module tbRam;
  
  localparam T = 6;
  localparam R = 2000;
  integer i,j,k;
  reg [11:0] fibonacci [0:9] [0:9];
  reg [11:0] data;
  reg clk, enable;
  wire [11:0] q;
  wire [10:0] cnt_point;
  wire [16:0] cnt_measure;
  wire [3:0] cnt_save;
  wire [10:0] cnt_div;
  wire switch;
  wire ready;
  wire div_en;
  wire [11:0] sum1;
  wire [11:0] sum2;
  wire [11:0] sum3;
 // wire [11:0] sum4;
  wire [11:0] sum5;
  wire [11:0] sum6;
  //wire [11:0] sum7;
 wire [10:0] cnt_ratio;
 wire ready_ratio;
 wire ratio_en;
 
  initial
  begin
    fibonacci [0] [0] = 12'd1;
    fibonacci [1] [0] = 12'd1;
    fibonacci [2] [0] = 12'd2;
    fibonacci [3] [0] = 12'd3;
    fibonacci [4] [0] = 12'd5;
    fibonacci [5] [0] = 12'd8;
    fibonacci [6] [0] = 12'd13;
    fibonacci [7] [0] = 12'd21;
    fibonacci [8] [0] = 12'd34;
    fibonacci [9] [0] = 12'd55;
    
    fibonacci [0] [1] = 12'd1;
    fibonacci [1] [1] = 12'd2;
    fibonacci [2] [1] = 12'd3;
    fibonacci [3] [1] = 12'd5;
    fibonacci [4] [1] = 12'd8;
    fibonacci [5] [1] = 12'd13;
    fibonacci [6] [1] = 12'd21;
    fibonacci [7] [1] = 12'd34;
    fibonacci [8] [1] = 12'd55;
    fibonacci [9] [1] = 12'd1;
    
    fibonacci [0] [2] = 12'd2;
    fibonacci [1] [2] = 12'd3;
    fibonacci [2] [2] = 12'd5;
    fibonacci [3] [2] = 12'd8;
    fibonacci [4] [2] = 12'd13;
    fibonacci [5] [2] = 12'd21;
    fibonacci [6] [2] = 12'd34;
    fibonacci [7] [2] = 12'd55;
    fibonacci [8] [2] = 12'd1;
    fibonacci [9] [2] = 12'd1;
    
    fibonacci [0] [3] = 12'd3;
    fibonacci [1] [3] = 12'd5;
    fibonacci [2] [3] = 12'd8;
    fibonacci [3] [3] = 12'd13;
    fibonacci [4] [3] = 12'd21;
    fibonacci [5] [3] = 12'd34;
    fibonacci [6] [3] = 12'd55;
    fibonacci [7] [3] = 12'd1;
    fibonacci [8] [3] = 12'd1;
    fibonacci [9] [3] = 12'd2;
    
    fibonacci [0] [4] = 12'd5;
    fibonacci [1] [4] = 12'd8;
    fibonacci [2] [4] = 12'd13;
    fibonacci [3] [4] = 12'd21;
    fibonacci [4] [4] = 12'd34;
    fibonacci [5] [4] = 12'd55;
    fibonacci [6] [4] = 12'd1;
    fibonacci [7] [4] = 12'd1;
    fibonacci [8] [4] = 12'd2;
    fibonacci [9] [4] = 12'd3;
    
    fibonacci [0] [5] = 12'd8;
    fibonacci [1] [5] = 12'd13;
    fibonacci [2] [5] = 12'd21;
    fibonacci [3] [5] = 12'd34;
    fibonacci [4] [5] = 12'd55;
    fibonacci [5] [5] = 12'd1;
    fibonacci [6] [5] = 12'd1;
    fibonacci [7] [5] = 12'd2;
    fibonacci [8] [5] = 12'd3;
    fibonacci [9] [5] = 12'd5;
    
    fibonacci [0] [6] = 12'd13;
    fibonacci [1] [6] = 12'd21;
    fibonacci [2] [6] = 12'd34;
    fibonacci [3] [6] = 12'd55;
    fibonacci [4] [6] = 12'd1;
    fibonacci [5] [6] = 12'd1;
    fibonacci [6] [6] = 12'd2;
    fibonacci [7] [6] = 12'd3;
    fibonacci [8] [6] = 12'd5;
    fibonacci [9] [6] = 12'd8;
    
    fibonacci [0] [7] = 12'd21;
    fibonacci [1] [7] = 12'd34;
    fibonacci [2] [7] = 12'd55;
    fibonacci [3] [7] = 12'd1;
    fibonacci [4] [7] = 12'd1;
    fibonacci [5] [7] = 12'd2;
    fibonacci [6] [7] = 12'd3;
    fibonacci [7] [7] = 12'd5;
    fibonacci [8] [7] = 12'd8;
    fibonacci [9] [7] = 12'd13;
    
    fibonacci [0] [8] = 12'd34;
    fibonacci [1] [8] = 12'd55;
    fibonacci [2] [8] = 12'd1;
    fibonacci [3] [8] = 12'd1;
    fibonacci [4] [8] = 12'd2;
    fibonacci [5] [8] = 12'd3;
    fibonacci [6] [8] = 12'd5;
    fibonacci [7] [8] = 12'd8;
    fibonacci [8] [8] = 12'd13;
    fibonacci [9] [8] = 12'd21;
    
    fibonacci [0] [9] = 12'd55;
    fibonacci [1] [9] = 12'd1;
    fibonacci [2] [9] = 12'd1;
    fibonacci [3] [9] = 12'd2;
    fibonacci [4] [9] = 12'd3;
    fibonacci [5] [9] = 12'd5;
    fibonacci [6] [9] = 12'd8;
    fibonacci [7] [9] = 12'd13;
    fibonacci [8] [9] = 12'd21;
    fibonacci [9] [9] = 12'd34;
    
end
  
  Raman uut
  (.clock(clk), .data(data), .rdreq(rdreq), .wrreq(wrreq), 
  .q(q), .enable(enable), .cnt_point(cnt_point), .cnt_measure(cnt_measure), .cnt_save(cnt_save),
  .cnt_div(cnt_div), .switch(switch), .cnt_ratio(cnt_ratio), .ratio_en(ratio_en), .ready_ratio(ready_ratio),
  .sum1(sum1), 
  .sum2(sum2), 
  .sum3(sum3),
  //.sum4(sum4),
  .sum5(sum5),
  .sum6(sum6),
  //.sum7(sum7),
  .ready(ready),
  .div_en(div_en)
  );
  
 always 
  begin
  clk = 1'b0; #(T/2);
  clk = 1'b1; #(T/2);
  end
  
  initial
  begin
   data = 12'd0;
   enable = 1'b1;
   
  for (k=0; k<=40; k = k+1) //   ????? ?????
  begin
  
  for (i=0; i<100; i = i+1) //100???  ????? ?????????
  begin
    @(posedge clk);
    enable = 1'b1;
    @(posedge clk);
    enable = 1'b0;
    for (j = 0; j<10; j = j+1) //200???  ????? ?????
    begin
      @(posedge clk);
      data = j + k + i;
      //fibonacci [j] [i];
    end
    repeat(R) @(posedge clk);
  end
end
    
  $stop;
  
  end
    
   
  
  

endmodule