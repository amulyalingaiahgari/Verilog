// Excess-3 to Gray Code Converter
module excess3_to_gray(
    input  [3:0] ex3,
    output [3:0] gray
);
    wire [3:0] bcd;
    assign bcd  = ex3 - 4'd3;
    assign gray = bcd ^ (bcd >> 1);
endmodule
