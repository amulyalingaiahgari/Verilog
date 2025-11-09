// 4x1 Demultiplexer (Basic Building Block)
module demux1x4(
    input din,
    input [1:0] sel,
    output reg [3:0] y
);
    always @(*) begin
        y = 4'b0000;       // default
        case(sel)
            2'b00: y[0] = din;
            2'b01: y[1] = din;
            2'b10: y[2] = din;
            2'b11: y[3] = din;
        endcase
    end
endmodule

// 1x16 Demultiplexer using only 4x1 DEMUXes
module demux1x16_using_4x1(
    input din,
    input [3:0] sel,
    output [15:0] y
);
    wire [3:0] w; // outputs of first 4x1 demux

    // Stage 1: Top-level demux (splits input into 4 groups)
    demux1x4 D0 (.din(din), .sel(sel[3:2]), .y(w));

    // Stage 2: Each w[i] drives a 4x1 demux
    demux1x4 D1 (.din(w[0]), .sel(sel[1:0]), .y(y[3:0]));
    demux1x4 D2 (.din(w[1]), .sel(sel[1:0]), .y(y[7:4]));
    demux1x4 D3 (.din(w[2]), .sel(sel[1:0]), .y(y[11:8]));
    demux1x4 D4 (.din(w[3]), .sel(sel[1:0]), .y(y[15:12]));
endmodule
