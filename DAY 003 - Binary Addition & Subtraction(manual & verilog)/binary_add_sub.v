module binary_add_sub(
    input  [3:0] A,       
    input  [3:0] B,       
    input        mode,    // 0 for Addition, 1 for Subtraction
    output [3:0] Result,  
    output       Carry,   // Carry or Borrow
    output       Overflow // Overflow flag
);

    wire [3:0] B_xor;     
    wire [4:0] Sum;

    // XOR with mode: if mode=1 (subtract), B is inverted (~B)
    assign B_xor = B ^ {4{mode}};

    // Perform addition: A + B' + mode
    assign Sum = A + B_xor + mode;

    assign Result   = Sum[3:0];
    assign Carry    = Sum[4];
    assign Overflow = (A[3] ^ B_xor[3] ^ Sum[3] ^ Sum[4]);

endmodule
