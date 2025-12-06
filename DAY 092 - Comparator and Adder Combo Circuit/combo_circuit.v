module comp_adder #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    output wire gt,
    output wire lt,
    output wire eq,
    output wire [WIDTH:0] sum
);

    // Comparator logic
    assign gt = (A > B);
    assign lt = (A < B);
    assign eq = (A == B);

    // Adder logic
    assign sum = A + B;

endmodule
