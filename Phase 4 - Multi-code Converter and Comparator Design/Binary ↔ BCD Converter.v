//Binary ↔ BCD Converter (for 4-bit range)
module binary_to_bcd(
  input  [3:0] bin,
  output reg [3:0] bcd
);
  always @(*) begin
    if (bin > 4'd9)
      bcd = 4'd9; // Limit to valid BCD range
    else
      bcd = bin;
  end
endmodule

module bcd_to_binary(
  input  [3:0] bcd,
  output [3:0] bin
);
  assign bin = bcd;
endmodule
