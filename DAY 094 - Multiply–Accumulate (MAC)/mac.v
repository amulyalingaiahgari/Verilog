module mac_unit #(
    parameter WIDTH = 8
)(
    input  logic                   clk,
    input  logic                   rst,
    input  logic                   en,
    input  logic [WIDTH-1:0]       A,
    input  logic [WIDTH-1:0]       B,
    output logic [(2*WIDTH)-1:0]   ACC
);

    logic [(2*WIDTH)-1:0] product;

    // Combinational multiplication
    assign product = A * B;

    // Sequential Accumulator
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            ACC <= '0;
        else if (en)
            ACC <= ACC + product;
    end

endmodule
