module sync_rom #(
    parameter DEPTH = 8,
    parameter WIDTH = 8
)(
    input  wire                  clk,
    input  wire [$clog2(DEPTH)-1:0] addr,
    output reg  [WIDTH-1:0]      dout
);

    // ROM memory array
    reg [WIDTH-1:0] rom [0:DEPTH-1];

    // Preload ROM contents (behavioral)
    initial begin
        rom[0] = 8'hA0;
        rom[1] = 8'hB1;
        rom[2] = 8'hC2;
        rom[3] = 8'hD3;
        rom[4] = 8'hE4;
        rom[5] = 8'hF5;
        rom[6] = 8'h12;
        rom[7] = 8'h34;
    end

        // Synchronous ROM read
    always @(posedge clk) begin
      dout <= rom[addr];
    end

endmodule
