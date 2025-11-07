module arithmetic_unit_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [1:0] SEL,
    output reg [7:0] RESULT,
    output reg COUT
);
    always @(*) begin
        case (SEL)
            2'b00: {COUT, RESULT} = A + B;       // Addition
            2'b01: {COUT, RESULT} = A - B;       // Subtraction
            2'b10: {COUT, RESULT} = A + 8'b00000001; // Increment
            2'b11: {COUT, RESULT} = A - 8'b00000001; // Decrement
            default: {COUT, RESULT} = 9'b0;
        endcase
    end
endmodule
