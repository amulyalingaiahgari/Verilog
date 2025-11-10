// Full Subtractor using Decoder 
module fs_using_decoder (
    input  A, B, Bin,
    output Diff, Borrow
);
    wire [7:0] d;

    // 3-to-8 Decoder for inputs (A, B, Bin)
    assign d[0] = ~A & ~B & ~Bin;  // 000
    assign d[1] = ~A & ~B &  Bin;  // 001
    assign d[2] = ~A &  B & ~Bin;  // 010
    assign d[3] = ~A &  B &  Bin;  // 011
    assign d[4] =  A & ~B & ~Bin;  // 100
    assign d[5] =  A & ~B &  Bin;  // 101
    assign d[6] =  A &  B & ~Bin;  // 110
    assign d[7] =  A &  B &  Bin;  // 111

    // Difference = 1 for input combinations 001, 010, 100, 111
    assign Diff   = d[1] | d[2] | d[4] | d[7];

    // Borrow = 1 for input combinations 001, 011, 101, 110
  assign Borrow = d[1] | d[2] | d[3] | d[7];
endmodule
