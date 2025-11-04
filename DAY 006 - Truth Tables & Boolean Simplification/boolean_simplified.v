//======================================================
// Day 6: Truth Table & Boolean Simplification
// F(A,B,C) = Σ(1,3,5,6)
// Simplified: F = A'C + B'C + ABC'
//======================================================
module boolean_simplified (
    input  A,
    input  B,
    input  C,
    output F
);

    assign F = (~A & C) | (~B & C) | (A & B & ~C);

endmodule
