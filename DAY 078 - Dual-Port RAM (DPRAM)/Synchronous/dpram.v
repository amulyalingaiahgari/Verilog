module dpram #(
    parameter DEPTH = 8,
    parameter WIDTH = 8
)(
    input  wire                  clk,
    input  wire                  rst,

    // PORT A
    input  wire                  we_a,
    input  wire [$clog2(DEPTH)-1:0] addr_a,
    input  wire [WIDTH-1:0]      din_a,
    output reg  [WIDTH-1:0]      dout_a,

    // PORT B
    input  wire                  we_b,
    input  wire [$clog2(DEPTH)-1:0] addr_b,
    input  wire [WIDTH-1:0]      din_b,
    output reg  [WIDTH-1:0]      dout_b
);

    // Memory declaration
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    // Port A operation
    always @(posedge clk) begin
        if(rst)
            dout_a <= '0;
        else begin
            if(we_a)
                mem[addr_a] <= din_a;
            else
                dout_a <= mem[addr_a];
        end
    end

    // Port B operation
    always @(posedge clk) begin
        if(rst)
            dout_b <= '0;
        else begin
            if(we_b)
                mem[addr_b] <= din_b;
            else
                dout_b <= mem[addr_b];
        end
    end

endmodule
