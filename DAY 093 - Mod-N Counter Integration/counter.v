module mod_n_counter #(
    parameter N = 10,              // Modulus value
    parameter WIDTH = 4            // Must be able to represent N
)(
    input  wire clk,
    input  wire rst,
    input  wire en,
    output reg  [WIDTH-1:0] count,
    output reg  tick               // 1-cycle pulse when counter wraps
);

    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            tick  <= 0;
        end
        else if (en) begin
            if (count == N-1) begin
                count <= 0;
                tick  <= 1'b1;     // rollover pulse
            end
            else begin
                count <= count + 1'b1;
                tick  <= 1'b0;
            end
        end
        else begin
            tick <= 1'b0;
        end
    end

endmodule



module mod_n_integration #(
    parameter N = 10,
    parameter WIDTH = 4
)(
    input  wire clk,
    input  wire rst,
    input  wire enable,
    output wire event_pulse
);
    wire [WIDTH-1:0] count;

    mod_n_counter #(
        .N(N),
        .WIDTH(WIDTH)
    ) cnt (
        .clk   (clk),
        .rst   (rst),
        .en    (enable),
        .count (count),
        .tick  (event_pulse)   // Integrated output
    );

endmodule
