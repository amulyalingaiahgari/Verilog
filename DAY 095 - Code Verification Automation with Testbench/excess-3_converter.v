module excess3 (
    input  [3:0] bcd,       // 0–9 valid input
    output [3:0] xs3        // Excess-3 code
);

    assign xs3 = bcd + 4'd3;

endmodule
