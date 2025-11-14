module m3 (result, clk, rst);
  input clk;
  input rst;
  output reg [16:0]result;
  
  reg skip;
  reg delay;
  
  always @(posedge clk)
  begin
    if(rst||result=100000) begin
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
    if(rst||delay||result == 100000)
      skip <= 0;
    else
      skip <=~ skip;
  end
  always @(posedge clk) 
  begin
    if (rst||result=100000)
      delay <= 1;
    else
      delay <= 0;
  end
endmodule
