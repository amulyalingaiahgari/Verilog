//======================================================
// Day 7 - Example 1: 2-variable K-map simplification
// F(A,B) = Σ(1,2) -> F = A'B + AB' = A XOR B
//======================================================
module kmap2 (
    input  A,B,
    output F
);
    assign F = A ^ B;
endmodule


//======================================================
// Day 7 - Example 2: 3-variable K-map simplification
// F(A,B,C) = Σ(1,2,5,7) -> F = A'BC' + B'C + AC
//======================================================
module kmap3 (
    input  A,B,C,
    output F
);
    assign F = (~A & B & ~C) | (~B & C) | (A & C);
endmodule


//======================================================
// Day 7 - Example 3: 4-variable K-map simplification
// F(A,B,C,D) = Σ(0,2,5,7,8,10,13,15)
// Simplified: F = B'D' + BD
//======================================================
module kmap4 (
    input  A,B,C,D,
    output F
);
    assign F = (~B & ~D) | (B & D);  // F = B XNOR D
endmodule
