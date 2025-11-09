// 1x4 Demux Module
module demux1x4(input din, input [1:0] sel, output reg [3:0] y);
    always @(*) begin
        y = 4'b0000;
        case (sel)
            2'b00: y[0] = din;
            2'b01: y[1] = din;
            2'b10: y[2] = din;
            2'b11: y[3] = din;
        endcase
    end
endmodule

// Logic Gates using DEMUX
module gates_using_demux(
    input a, b,
    output not_y, and_y, or_y, nand_y, nor_y, xor_y, xnor_y
);
    wire [3:0] y;  // Outputs from DEMUX
    wire [1:0] sel;

    assign sel = {a, b};

    // Instantiate DEMUX
    demux1x4 d1(.din(1'b1), .sel(sel), .y(y));

    // Gates using DEMUX outputs
    assign and_y  = y[3];
    assign or_y   = y[1] | y[2] | y[3];
    assign nand_y = ~and_y;
    assign nor_y  = ~or_y;
    assign xor_y  = y[1] | y[2];
    assign xnor_y = ~xor_y;
    assign not_y  = (a) ? 1'b0 : 1'b1;  // simple NOT gate

endmodule
