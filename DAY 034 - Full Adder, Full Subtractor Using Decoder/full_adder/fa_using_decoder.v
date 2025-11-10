// Full Adder using Decoder 
module fa_using_decoder (
    input  A, B, Cin,
    output Sum, Carry
);
    wire [7:0] d;  // Decoder outputs

    // 3x8 decoder using direct boolean equations
    assign d[0] = ~A & ~B & ~Cin;
    assign d[1] = ~A & ~B &  Cin;
    assign d[2] = ~A &  B & ~Cin;
    assign d[3] = ~A &  B &  Cin;
    assign d[4] =  A & ~B & ~Cin;
    assign d[5] =  A & ~B &  Cin;
    assign d[6] =  A &  B & ~Cin;
    assign d[7] =  A &  B &  Cin;

    // Combine decoder outputs to form Sum and Carry
    assign Sum   = d[1] | d[2] | d[4] | d[7];
    assign Carry = d[3] | d[5] | d[6] | d[7];
endmodule
