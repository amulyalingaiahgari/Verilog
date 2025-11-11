//4-bit Comparator (Common Module)
module comparator_4bit(
  input  [3:0] A, B,
  output reg gt, lt, eq
);
  always @(*) begin
    gt = 0; lt = 0; eq = 0;
    if (A > B) gt = 1;
    else if (A < B) lt = 1;
    else eq = 1;
  end
endmodule
