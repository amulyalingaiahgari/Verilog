module spram #(
    parameter DEPTH = 256,
    parameter WIDTH = 8,
    localparam ADDR_WIDTH = $clog2(DEPTH)
)(
    input  wire                  clk,
    input  wire                  rst,
    input  wire                  we,
    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [WIDTH-1:0]      din,
    output reg  [WIDTH-1:0]      dout
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];

    always @(posedge clk) begin
        if(rst) begin
            dout <= '0;
        end 
        else begin
            if(we)
                mem[addr] <= din;
            else
                dout <= mem[addr];
        end
    end

endmodule
