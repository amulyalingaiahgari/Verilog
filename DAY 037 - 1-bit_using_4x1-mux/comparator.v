// 1-bit Comparator using 4x1 MUX
module one_bit_comparator_using_mux4x1(
    input a, b,
    output lt, gt, eq
);
    // lt = 1 when a<b → only for a=0, b=1 → sel=01
    mux4x1 m1(1'b0, 1'b1, 1'b0, 1'b0, a, b, lt);

    // gt = 1 when a>b → only for a=1, b=0 → sel=10
    mux4x1 m2(1'b0, 1'b0, 1'b1, 1'b0, a, b, gt);

    // eq = 1 when a==b → sel=00 or 11
    mux4x1 m3(1'b1, 1'b0, 1'b0, 1'b1, a, b, eq);
endmodule



// 4x1 MUX
module mux4x1(
    input a, b, c, d,
    input s1, s0,
    output reg y
);
    always @(*) begin
        case ({s1, s0})
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
            default: y = 1'b0; // synthesis-safe default
        endcase
    end
endmodule
