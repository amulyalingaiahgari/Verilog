// BCD to Excess-3 Converter
module bcd_to_excess3(
    input  [3:0] bcd,
    output [3:0] ex3
);
    assign ex3 = bcd + 4'd3;
endmodule
