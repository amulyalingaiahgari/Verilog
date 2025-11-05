module carry_save_adder#(parameter N = 8)(
    input  [N-1:0] A, B, C,
    output [N-1:0] Sum,
    output [N-1:0] Carry
);
    // Each bit is computed independently (no carry propagation)
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : csa_bit
            assign Sum[i]   = A[i] ^ B[i] ^ C[i];
            assign Carry[i] = (A[i] & B[i]) | (B[i] & C[i]) | (A[i] & C[i]);
        end
    endgenerate
endmodule


module carry_save_final_sum#(parameter N = 8)(
  input  [N-1:0] A, B, C,
  output [N:0] Final_Sum
);
  wire [N-1:0] Sum, Carry;
    
    // Step 1: Carry Save Stage
    carry_save_adder csa (
        .A(A), .B(B), .C(C),
        .Sum(Sum), .Carry(Carry)
    );
    
    // Step 2: Add Sum and shifted Carry
    assign Final_Sum = Sum + {Carry, 1'b0}; // Shift Carry left by 1
endmodule
