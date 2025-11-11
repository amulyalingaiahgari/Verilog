// BCD to Gray Code Converter
module bcd_to_gray(
    input  [3:0] bcd,
    output [3:0] gray
);
    assign gray = bcd ^ (bcd >> 1);
endmodule
