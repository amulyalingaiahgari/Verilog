module m3 (count, clk, rst) ;
  input clk;
  input rst;
  output reg [3:0]count;
  
  reg [3:0]result;
  wire cs,ds;
  reg es;
  reg [1:0]count1;
  
  always @(posedge clk) begin
    if (rst)
      result <= 0;
      else
      result <= result+1;
  end
  
  always @(*) begin
    if(cs)
      count <= 0;
    else
    count <= result;
  end
  
  always @(posedge clk) begin
    if(ds)
      count1 <= 0;
    else
    count1 <= count1 +1;
  end
  
  always @(posedge clk) begin
    if (rst| |result == 4'hf)
      es=1;
    else
    es=0;
  end
  
  assign ds=(es|count1[1]);
  assign cs=count1[1];
endmodule
