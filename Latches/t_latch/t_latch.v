module t_latch (
  input t,
  output reg q,
  output qbar);

  assign qbar =~ q;
  always @(*) begin
    if(t)
      q <=~ q;
    else
      q <= q;
  end
endmodule
