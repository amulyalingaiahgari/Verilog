module mod8(clk, reset, count);
  input clk;
  input reset;
  output reg [2:0] count;

  always @(posedge clk) begin
    if (reset)
      count <= 0;
    else
      count <= (count + 1);
  end
endmodule
