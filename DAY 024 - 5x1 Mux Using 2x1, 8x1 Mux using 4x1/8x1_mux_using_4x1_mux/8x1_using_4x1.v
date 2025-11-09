// 8x1 Multiplexer using 4x1 MUXes
module mux8x1_using_4x1 (
    input  [7:0] in,         // 8 input lines
    input  [2:0] sel,        // 3-bit select lines
    output out               // output
);
    wire y1, y2;             // intermediate outputs

    // Two 4x1 MUXes handle 0-3 and 4-7 inputs
    mux4x1 M1 (.in(in[3:0]), .sel(sel[1:0]), .y(y1));   // lower group
    mux4x1 M2 (.in(in[7:4]), .sel(sel[1:0]), .y(y2));   // upper group

    // Third 4x1 MUX used as 2x1 MUX (only sel[2] used)
    mux4x1 M3 (.in({2'b00, y2, y1}), .sel({1'b0, sel[2]}), .y(out));

endmodule


// 4x1 MUX module
module mux4x1 (
    input  [3:0] in,
    input  [1:0] sel,
    output y
);
    assign y = sel == 2'b00 ? in[0] :
               sel == 2'b01 ? in[1] :
               sel == 2'b10 ? in[2] :
                              in[3];
endmodule
