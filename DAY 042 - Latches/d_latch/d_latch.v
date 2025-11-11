module d_latch(
  input d,
  input en,        // enable signal
  output reg q,
  output qbar
);

  always @(*) begin
    if (en)
      q = d;       // transparent when enable = 1
    // else retain previous q automatically
  end
  
  assign qbar = ~q;  // complement output

endmodule
