// 5x1 Multiplexer using 2x1 MUXes
module mux5x1 (
    input  [4:0] in,       // 5 input lines
    input  [2:0] sel,      // 3-bit select
    output out             // Output
);
    wire m1, m2, m3;       // intermediate signals

    // Level 1: select between pairs
    mux2x1 M1 (.a(in[0]), .b(in[1]), .sel(sel[0]), .y(m1));
    mux2x1 M2 (.a(in[2]), .b(in[3]), .sel(sel[0]), .y(m2));

    // Level 2: select between the two groups (0–3)
    mux2x1 M3 (.a(m1), .b(m2), .sel(sel[1]), .y(m3));

    // Level 3: select between group(0–3) and in[4]
    mux2x1 M4 (.a(m3), .b(in[4]), .sel(sel[2]), .y(out));

endmodule


// 2x1 MUX 
module mux2x1 (
    input a, b,
    input sel,
    output y
);
    assign y = sel ? b : a;
endmodule
