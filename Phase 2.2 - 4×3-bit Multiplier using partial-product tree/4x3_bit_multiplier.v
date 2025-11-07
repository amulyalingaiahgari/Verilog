// 4x3-bit Multiplier using Partial Product Tree
module multiplier_4x3 (
    input  [3:0] A,
    input  [2:0] B,
  output  [6:0] P
);
    // Partial products
    wire [3:0] pp0, pp1, pp2;
  wire [6:0] sum1, sum2;

    assign pp0 = A & {4{B[0]}};   // A * B0
    assign pp1 = A & {4{B[1]}};   // A * B1
    assign pp2 = A & {4{B[2]}};   // A * B2

    // Add partial products
  assign sum1 = {1'b0, pp0} + {pp1, 1'b0};    // First addition
    assign sum2 = sum1 + {pp2, 2'b00};          // Second addition

    // Final product
    assign P = sum2;

endmodule
