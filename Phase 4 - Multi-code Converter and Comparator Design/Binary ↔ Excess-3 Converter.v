//Binary ↔ Excess-3 Converter
module binary_to_excess3(
  input  [3:0] bin,
  output [3:0] ex3
);
  assign ex3 = bin + 4'd3;
endmodule

module excess3_to_binary(
  input  [3:0] ex3,
  output [3:0] bin
);
  assign bin = ex3 - 4'd3;
endmodule
