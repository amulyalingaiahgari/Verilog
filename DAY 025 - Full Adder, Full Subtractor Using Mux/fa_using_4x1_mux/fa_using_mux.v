// Full Adder using two 4x1 Multiplexers
module full_adder_using_mux (
    input A, B, Cin,
    output Sum, Cout
);

    // Wires for MUX select inputs
    wire [1:0] sel = {A, B};

    // --- SUM MUX ---
    mux4x1 mux_sum (
        .in({Cin, ~Cin, ~Cin, Cin}),  // I3 I2 I1 I0
        .sel(sel),
        .out(Sum)
    );

    // --- CARRY MUX ---
    mux4x1 mux_carry (
        .in({1'b1, Cin, Cin, 1'b0}),  // I3 I2 I1 I0
        .sel(sel),
        .out(Cout)
    );
endmodule


// 4x1 Multiplexer
module mux4x1 (
    input [3:0] in,
    input [1:0] sel,
    output out
);
    assign out = in[sel];
endmodule
