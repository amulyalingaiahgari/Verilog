module controlled_buffer_register (
  input  [3:0] d,   // 4-bit input
  input        en,  // Enable signal
  output reg [3:0] q
);
  always @(*) begin
    if (en)
      q = d;        // Pass data when enable is high
    else
      q = 4'bzzzz;  // High impedance (acts like disconnected)
  end
endmodule
