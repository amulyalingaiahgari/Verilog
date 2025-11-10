module comp (
    output eq,
    output gt,
    output lt,
    input  [1:0] a,
    input  [1:0] b
);
    // Compare two 2-bit numbers
    assign eq = (a == b);
    assign gt = (a >  b);
    assign lt = (a <  b);
endmodule
