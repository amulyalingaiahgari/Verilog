// Full Subtractor using two 4x1 Multiplexers
module full_subtractor_using_mux (
    input A, B, Bin,
    output Diff, Bout
);

    wire [1:0] sel = {A, B};

    // --- DIFFERENCE MUX ---
    mux4x1 mux_diff (
        .in({Bin, ~Bin, ~Bin, Bin}),  // I3 I2 I1 I0
        .sel(sel),
        .out(Diff)
    );

    // --- BORROW MUX ---
    mux4x1 mux_borrow (
        .in({Bin, 1'b0, 1'b1, Bin}),  // I3 I2 I1 I0
        .sel(sel),
        .out(Bout)
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
