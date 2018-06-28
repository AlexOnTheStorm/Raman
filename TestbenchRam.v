`timescale 1 ns/10 ps

module tbRam;
  
  localparam T = 24;
  localparam R = 2000;
  integer i,j,k;
  
  
  reg [11:0] data;
  reg clk, enable, clk0;
  
  
	wire ready;
	wire ratio_enable;
	wire start;
	wire C0;
	wire wrreq;
	wire rdreq;
	wire switch;
	wire div_enable;
	wire [10:0] cnt_div;
	wire [16:0] cnt_measure;
	wire [10:0] cnt_point;
	wire [3:0] cnt_save;
	wire [11:0] q;
	wire [28:0] qantistokes;
	wire [11:0] qout;
	wire [28:0] qstokes;
	wire [28:0] qsummary;
	wire [10:0] rdaddress;
	wire wren;
	wire [11:0] quotient;
	wire [28:0] datamem;
	wire [10:0] wraddr;
	wire aclr;
	wire wren_antistokes;
	wire wren_stokes;
	wire wren_storage;
	wire [14:0] wr_address_storage;
	wire [14:0] rd_address_storage;
	wire wren_temp;
	wire [10:0] cnt_ratio;
	wire [11:0] q_storage;
	wire [11:0] quot_ratio;
  

  
  Raman uut
  (.clk(clk), 
  .data(data),
  .enable(enable),
  .switch(switch),
  .cnt_point(cnt_point), 
  .cnt_measure(cnt_measure), 
	.ready(ready),
	.ratio_enable(ratio_enable),
	.start(start),
	.C0(C0),
	.wrreq(wrreq),
	.rdreq(rdreq),
	.div_enable(div_enable),
	.cnt_div(cnt_div),
	.cnt_save(cnt_save),
	.q(q),
	.qantistokes(qantistokes),
	.qout(qout),
	.qstokes(qstokes),
	.qsummary(qsummary),
	.rdaddress(rdaddress),
	.wren(wren),
	.quotient(quotient),
	.datamem(datamem),
	.wraddr(wraddr),
	.aclr(aclr),
	.wren_stokes(wren_stokes),
	.wren_antistokes(wren_antistokes),
	.wren_storage(wren_storage),
	.wr_address_storage(wr_address_storage),
	.rd_address_storage(rd_address_storage),
	.q_storage(q_storage),
	.wren_temp(wren_temp),
	.cnt_ratio(cnt_ratio),
	.quot_ratio(quot_ratio)
  );
  
 always 
  begin
  clk = 1'b0; #(T/2);
  clk = 1'b1; #(T/2);
  end
  
   always 
  begin
  clk0 = 1'b0; #(T/8);
  clk0 = 1'b1; #(T/8);
  end
  
  initial
  begin
   data = 12'd0;
   enable = 1'b1;
   
	repeat(20) @(posedge clk0);
	
  for (k=0; k<12; k = k+1) 
  begin
  
  for (i=0; i<100; i = i+1) //100000
  begin
    @(posedge clk0);
    enable = 1'b1;
    @(posedge clk0);
    enable = 1'b0;
    for (j = 0; j<10; j = j+1) //1500
    begin
      @(posedge clk0);
      data = j*100 + k*100 + i*100;
    end
    repeat(R) @(posedge clk0);
  end
end
    
  $stop;
  
  end
    
   
  
  

endmodule