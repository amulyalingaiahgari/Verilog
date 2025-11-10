// 1x8 DEMUX (Behavioral)
module demux_1x8(
    input d,
    input [2:0] sel,
    output reg [7:0] y
);
    always @(*) begin
        y = 8'b00000000;   // Default all outputs to 0
        if (d)
            y[sel] = 1'b1;  // Activate one line based on select input
    end
endmodule


// Full Subtractor using DEMUX
module full_subtractor_using_demux(
    input a, b, bin,
    output reg diff, bout
);
    wire [7:0] y;
    wire [2:0] sel;

    assign sel = {a, b, bin};

    // Instantiate DEMUX
    demux_1x8 d1(.d(1'b1), .sel(sel), .y(y));

    // Behavioral logic for Difference and Borrow
    always @(*) begin
        // Difference = a ⊕ b ⊕ bin
        // Borrow = (¬a & b) | (¬a & bin) | (b & bin)
        diff  = y[1] | y[2] | y[4] | y[7];
        bout  = y[1] | y[2] | y[3] | y[7];
    end
endmodule
