// Excess-3 to BCD Converter
module excess3_to_bcd(
    input  [3:0] ex3,
    output [3:0] bcd
);
    assign bcd = ex3 - 4'd3;
endmodule
