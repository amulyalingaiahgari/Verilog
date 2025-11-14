module mod7(clk, reset, count);
  input clk;
  input reset;
  output reg [2:0] count;

  always @(posedge clk) begin
    if (reset || (count[2] && count [1] ))
      count <= 0;
    else
      count <= (count + 1);
  end
endmodule
