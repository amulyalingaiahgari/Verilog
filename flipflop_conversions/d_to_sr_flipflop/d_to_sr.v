module d_sr (q,qbar,clk, rst,s,r);
  input clk;
  input rst;
  input s;
  input r;
  output reg q;
  output qbar;
  wire d;

  assign d=(s & ~q) | (~r & q);
  always @(posedge clk) begin
    if(rst)
      q <= 1'b0;
    else
      q <= d
  end
  assign qbar = ~q;
endmodule
