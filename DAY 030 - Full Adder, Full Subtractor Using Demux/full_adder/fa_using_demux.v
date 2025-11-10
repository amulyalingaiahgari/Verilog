// 1x8 DEMUX (Behavioral)
module demux_1x8(
    input d,
    input [2:0] sel,
    output reg [7:0] y
);
    always @(*) begin
        // Default all outputs to 0
        y = 8'b00000000;
        // Enable only one output based on select value
        if (d)
            y[sel] = 1'b1;
    end
endmodule


// Full Adder using DEMUX
module full_adder_using_demux(
    input a, b, cin,
    output reg sum, cout
);
    wire [7:0] y;
    wire [2:0] sel;

    assign sel = {a, b, cin};

    demux_1x8 d1(
        .d(1'b1),
        .sel(sel),
        .y(y)
    );

    // Behavioral logic for Sum and Carry using DEMUX outputs
    always @(*) begin
        // Based on Full Adder truth table:
        sum  = y[1] | y[2] | y[4] | y[7];
        cout = y[3] | y[5] | y[6] | y[7];
    end
endmodule
