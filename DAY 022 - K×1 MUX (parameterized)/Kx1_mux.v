module mux_kx1 #(parameter K = 5)(    // Number of inputs
    input  [K-1:0] in,                // K inputs
    input  [$clog2(K)-1:0] sel,       // log2(K) select lines
    output reg out                    // Output
);
    always @(*) begin
        out = in[sel];  // Direct index selection
    end
endmodule
