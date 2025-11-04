//============================================================
// Phase 1 - Mini Project #1: Configurable Logic Circuit
//============================================================
module configurable_logic (
    input  logic A, B,
    input  logic [2:0] SEL,
    output logic Y
);

    always_comb begin
        case (SEL)
            3'b000: Y = A & B;       // AND
            3'b001: Y = A | B;       // OR
            3'b010: Y = A ^ B;       // XOR
            3'b011: Y = ~(A | B);    // NOR
            3'b100: Y = ~(A & B);    // NAND
            3'b101: Y = ~(A ^ B);    // XNOR
            3'b110: Y = ~A;          // NOT
            3'b111: Y = A;           // BUFFER
            default: Y = 1'b0;
        endcase
    end

endmodule
