// 2-bit Binary Multiplier
module binary_multiplier_2bit (
    input [1:0] A,
    input [1:0] B,
    output [3:0] P
);
    wire [1:0] pp0, pp1;

    // Partial products
    assign pp0 = A & {2{B[0]}};    // A * B0
    assign pp1 = A & {2{B[1]}};    // A * B1

    // Final Product = pp0 + (pp1 << 1)
    assign P[0] = pp0[0];
    assign P[1] = pp0[1] ^ pp1[0];
    assign P[2] = pp1[1] ^ (pp0[1] & pp1[0]);
    assign P[3] = pp1[1] & (pp0[1] & pp1[0]);

endmodule
