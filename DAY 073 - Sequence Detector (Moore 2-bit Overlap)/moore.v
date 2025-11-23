module seq_11011_moore_2overlap (
    input  wire clk,
    input  wire reset,
    input  wire din,
    output reg  dout
);

    // State Encoding
    typedef enum logic [2:0] {
        S0,  // No match yet
        S1,  // 1
        S2,  // 11
        S3,  // 110
        S4,  // 1101
        S5   // 11011 - Pattern Detected
    } state_t;

    state_t ps, ns;

    // State Transition - Sequential
    always @(posedge clk or posedge reset) begin
        if (reset)
            ps <= S0;
        else
            ps <= ns;
    end

    // Next State Logic
    always @(*) begin
        case (ps)
            S0: ns = (din) ? S1 : S0;
            S1: ns = (din) ? S2 : S0;
            S2: ns = (din) ? S2 : S3;
            S3: ns = (din) ? S4 : S0;
            S4: ns = (din) ? S5 : S2;
            // S5 – Pattern Detected -> 2-bit overlap -> last 2 bits = "11"
            S5: ns = (din) ? S2 : S3;
            default: ns = S0;
        endcase
    end

    // Output Logic (Moore Output)
    always @(*) begin
        dout = (ps == S5);
    end

endmodule
