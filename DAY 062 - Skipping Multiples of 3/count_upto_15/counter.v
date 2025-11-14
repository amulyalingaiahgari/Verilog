module m3 (result, clk, rst);
  input clk;
  input rst;
  output reg [3:0]result;
  
  reg skip;
  reg ds;
  
  always @(posedge clk)
  begin
    if(rst) begin
      result <= 0;
    end
    else begin
      if(skip)
        result <= result+2;
      else
        result <= result+1;
    end
  end
  always @(posedge clk)
  begin
    if(rst||ds||result == 0)
      skip <= 0;
    else
      skip <=~ skip;
  end
  always @(posedge clk) 
  begin
    if (rst)
      ds <= 1;
    else
      ds <= 0;
  end
endmodule
