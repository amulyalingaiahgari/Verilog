module excess3_adder (
    input  [3:0] A,  // First Excess-3 number
    input  [3:0] B,  // Second Excess-3 number
    output [3:0] SUM, // 4-bit result in Excess-3 form
    output       COUT // Carry out
);
    wire [4:0] temp_sum;
    wire [4:0] corrected_sum;

    // Step 1: Add A and B
    assign temp_sum = A + B;

    // Step 2: If sum > 9 (1001), add 6 (0110)
    assign corrected_sum = (temp_sum > 9) ? (temp_sum + 6) : temp_sum;

    // Step 3: Output
    assign SUM  = corrected_sum[3:0];
    assign COUT = corrected_sum[4];
endmodule
