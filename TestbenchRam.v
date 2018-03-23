`timescale 1 ns/10 ps

module tbRam;
  
  localparam T = 6;
  localparam R = 2000;
  integer i,j,k;
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
  wire [29:0] sum1;
  wire [29:0] sum2;
  wire [29:0] sum3;
  wire [29:0] sum4;
  wire [29:0] sum5;
 
  wire [11:0] ratio1;
  wire [11:0] ratio2;
  wire [11:0] ratio3;
  wire [11:0] ratio4;
  wire [11:0] ratio5;
  
  wire [11:0] store1;
  wire [11:0] store2;
  wire [11:0] store3;
  wire [11:0] store4;
  wire [11:0] store5;
  wire [11:0] store6;
  wire [11:0] store7;
  wire [11:0] store8;
  wire [11:0] store9;
  wire [11:0] store10;
 
 wire [11:0] quotient;
 wire [10:0] cnt_ratio;
 wire ready_ratio;
 wire ratio_en;
 wire rdreq;
 wire wrreq;
 /*wire [14:0] presum;
 wire [11:0] prestore;*/
 
 wire [11:0] one;
 wire [11:0] two;
 wire [11:0] three;
 wire [11:0] eight;
 wire [11:0] nine;
 wire [11:0] ten;
 
  
  Raman uut
  (.clk(clk), 
  .data(data),
  .enable(enable),
  .switch(switch),
  .one(one),
  .two(two),
  .three(three),
  .eight(eight),
  .nine(nine),
  .ten(ten)
  
  /*.rdreq(rdreq), .wrreq(wrreq), 
  .q(q),  .cnt_point(cnt_point), .cnt_measure(cnt_measure), .cnt_save(cnt_save),
  .cnt_div(cnt_div),  .cnt_ratio(cnt_ratio), .ratio_en(ratio_en), .ready_ratio(ready_ratio),
  
  .sum1(sum1), 
  .sum2(sum2), 
  .sum3(sum3),
  .sum4(sum4),
  .sum5(sum5),
  
  .ratio1(ratio1),
  .ratio2(ratio2),
  .ratio3(ratio3),
  .ratio4(ratio4),
  .ratio5(ratio5),
  
  .store1(store1),
  .store2(store2),
  .store3(store3),
  .store4(store4),
  .store5(store5),
  .store6(store6),
  .store7(store7),
  .store8(store8),
  .store9(store9),
  .store10(store10),
  
  .quotient(quotient),
  .ready(ready),
  .div_en(div_en),
  
  //.presum(presum),
  //.prestore(prestore)*/
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
   
  for (k=0; k<=40; k = k+1) 
  begin
  
  for (i=0; i<100; i = i+1) //100000
  begin
    @(posedge clk);
    enable = 1'b1;
    @(posedge clk);
    enable = 1'b0;
    for (j = 0; j<10; j = j+1) //1500
    begin
      @(posedge clk);
      data = j + k + i;
    end
    repeat(R) @(posedge clk);
  end
end
    
  $stop;
  
  end
    
   
  
  

endmodule