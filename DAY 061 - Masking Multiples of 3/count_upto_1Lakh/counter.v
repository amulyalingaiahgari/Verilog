module m3 (result, clk, rst) ;
  input clk;
  input rst;
  output reg [3:0]result;
  
  reg [3:0]count;
  wire cs,delay;
  reg es;
  reg [1:0]count1;
  
  always @(posedge clk) begin
    if (rst)
      count <= 0;
    else
      count <= count+1;
  end
  always @(*) begin
    if(cs)
      result <= 0;
    else
      result <= count;
  end
  always @(posedge clk) begin
    if (delay)
      count1 <= 0;
    else
      count1 <= count1 +1;
  end
  always @(posedge clk) begin
    if (rst || count == 4'hf)
      es=1;
    else
      es=0;
  end
  assign delay=(es|count1[1]);
  assign cs=count1[1];
endmodule
