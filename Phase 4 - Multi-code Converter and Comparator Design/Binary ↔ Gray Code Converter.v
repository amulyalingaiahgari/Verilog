//Binary ↔ Gray Code Converter
module binary_to_gray(
  input  [3:0] bin,
  output [3:0] gray
);
  assign gray[3] = bin[3];
  assign gray[2] = bin[3] ^ bin[2];
  assign gray[1] = bin[2] ^ bin[1];
  assign gray[0] = bin[1] ^ bin[0];
endmodule

module gray_to_binary(
  input  [3:0] gray,
  output [3:0] bin
);
  assign bin[3] = gray[3];
  assign bin[2] = bin[3] ^ gray[2];
  assign bin[1] = bin[2] ^ gray[1];
  assign bin[0] = bin[1] ^ gray[0];
endmodule
