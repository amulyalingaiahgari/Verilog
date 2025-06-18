module sr (q,qbar, s,r);
  input s,r;
  output reg q;
  output qbar;

  assign qbar =- q;
  always @(s or r) begin
    case ({s, r})
      2'b00:q <= q;
      2'b01:q <= 0;
      2'b10:q <= 1;
      2'b11:q <= q;
    endcase
  end
endmodule
