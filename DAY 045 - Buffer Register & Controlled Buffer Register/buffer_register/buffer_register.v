module buffer_register (
  input  [3:0] d,    // 4-bit input data
  output [3:0] q     // 4-bit output data
);
  assign q = d;       // Simple buffering (direct output)
endmodule
