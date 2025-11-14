module nbit_counter #(
    parameter N = 4              // Width of counter
)(
    input               clk,     // Clock
    input               rst_n,   // Active-low reset
    input               en,      // Enable
    output reg [N-1:0]  count    // Counter output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= {N{1'b0}};        // Reset counter to 0
        else if (en)
            count <= count + 1'b1;     // Increment when enabled
        else
            count <= count;            // Hold value when disabled
    end

endmodule
