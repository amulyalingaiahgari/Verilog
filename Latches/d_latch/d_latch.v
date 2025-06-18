module d_latch(q,qbar,d);
  input d;
  output reg q;
  output qbar;

  always @(d) begin
    q <= d;
  end
  
  assign qbar=q;
endmodule
