module comparator (
    input  [3:0] A,
    input  [3:0] B,
    output reg   A_grt_B,
    output reg   A_less_B,
    output reg   A_eq_B
);
    always @(*) begin
        // Default all outputs to 0
        A_grt_B  = 1'b0;
        A_less_B = 1'b0;
        A_eq_B   = 1'b0;

        // Compare logic
        if (A > B)
            A_grt_B = 1'b1;
        else if (A < B)
            A_less_B = 1'b1;
        else
            A_eq_B = 1'b1;
    end
endmodule
