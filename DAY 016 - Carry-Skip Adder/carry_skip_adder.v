module carry_skip_adder_8bit (
    input  logic [7:0] A, B,
    input  logic       Cin,
    output logic [7:0] Sum,
    output logic       Cout
);

    logic [7:0] P, G, C;
    logic P_block1, P_block2;
    logic C_mid, C_out1, C_out2;

    // Propagate and Generate signals
    assign P = A ^ B;
    assign G = A & B;

    // --- Block 1: bits [3:0] ---
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C_out1 = G[3] | (P[3] & C[3]);
    assign P_block1 = &P[3:0];   // All propagate

    // Skip logic for mid-carry
    assign C_mid = (P_block1) ? Cin : C_out1;

    // --- Block 2: bits [7:4] ---
    assign C[4] = C_mid;
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C_out2 = G[7] | (P[7] & C[7]);
    assign P_block2 = &P[7:4];

    // Final Carry-out (skip logic)
    assign Cout = (P_block2) ? C_mid : C_out2;

    // Sum outputs
    assign Sum = P ^ {C[7:0]};

endmodule
