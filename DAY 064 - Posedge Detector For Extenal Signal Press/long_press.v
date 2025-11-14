module rtl (count, clk, rst, press) ;
  input clk;
  input rst;
  input press;
  output reg [3:0]count;

  reg intsig;
  wire pd;
  reg w1;
 
  always @(posedge clk) begin
    if (rst)
      count <= 0;
    else
    if (intsig)
      count <= count+1;
    else
    count <= count;
  end
  
  always @(posedge clk) begin
    if (rst)
      intsig <= 0;
    else
    if (pd)
      intsig <= ~intsig;
    else
    intsig <= intsig;
  end
  
  always @(posedge clk) begin
    wl <= press;
  end

  assign pd = (press) & (!w1);
endmodule
