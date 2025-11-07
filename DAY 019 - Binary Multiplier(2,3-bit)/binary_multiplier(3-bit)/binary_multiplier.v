// 3-bit Binary Multiplier
module binary_multiplier_3bit (
    input [2:0] A,
    input [2:0] B,
    output [5:0] P
);
    wire [2:0] pp0, pp1, pp2;
    wire [4:0] sum1, sum2;

    // Partial products
    assign pp0 = A & {3{B[0]}};  // A * B0
    assign pp1 = A & {3{B[1]}};  // A * B1
    assign pp2 = A & {3{B[2]}};  // A * B2

    // Add the shifted partial products
    assign sum1 = {1'b0, pp0} + {pp1, 1'b0};
    assign sum2 = {sum1} + {pp2, 2'b00};

    // Final product
    assign P = sum2;

endmodule
