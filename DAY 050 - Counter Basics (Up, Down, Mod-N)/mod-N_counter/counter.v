// Mod-N Counter (Generic)
module modN_counter #(
    parameter N = 10,               // modulus value
    parameter WIDTH = 4             // bit-width (enough to hold N-1)
)(
    input clk,
    input rst_n,
    output reg [WIDTH-1:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 0;
        else if (count == N-1)
            count <= 0;             // reset when max reached
        else
            count <= count + 1'b1;  // increment
    end
endmodule
