module comparator_1bit (
    input  A,
    input  B,
    output A_greater,
    output A_equal,
    output A_less
);
    assign A_greater =  A & ~B;  // A=1, B=0
    assign A_less    = ~A &  B;  // A=0, B=1
    assign A_equal   = ~(A ^ B); // A == B
endmodule
