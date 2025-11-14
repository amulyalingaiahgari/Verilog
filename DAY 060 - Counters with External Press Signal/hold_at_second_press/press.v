module dph (count, clk, rst, press);
  input press;
  input clk;
  input rst;
  output reg [3:0]count;
  reg wl;
  
  always @(posedge clk) begin
    if (rst)
      w1 <= 0;
    else
    if (press)
      wl <=~ wl;
    else
    w1 <= w1;
  end
  
  always @(posedge clk) begin
    if (rst)
      count <= 0;
    else
    if (w1)
      count <= (count+1);
    else
    count <= count;
  end
endmodule
