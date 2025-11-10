// N-bit Comparator (Behavioral, Parameterized)
module n_bit_comparator #(
    parameter N = 8             // Width of inputs
)(
    input  [N-1:0] A, B,        // Two N-bit inputs
    output reg A_gt_B,          // A greater than B
    output reg A_lt_B,          // A less than B
    output reg A_eq_B           // A equal to B
);

    always @(*) begin
        // Default values
        A_gt_B = 0;
        A_lt_B = 0;
        A_eq_B = 0;

        // Compare directly using relational operators
        if (A > B)
            A_gt_B = 1'b1;
        else if (A < B)
            A_lt_B = 1'b1;
        else
            A_eq_B = 1'b1;
    end
endmodule
