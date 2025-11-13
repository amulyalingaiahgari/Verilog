// 4-bit Ripple Counter (Asynchronous)
module ripple_counter (
    input clk,          // clock input
    input rst_n,        // active-low reset
    output [3:0] q      // 4-bit counter output
);
    // Internal flip-flop connections
    T_FF t0 (.clk(clk),    .rst_n(rst_n), .t(1'b1), .q(q[0]));
    T_FF t1 (.clk(q[0]),   .rst_n(rst_n), .t(1'b1), .q(q[1]));
    T_FF t2 (.clk(q[1]),   .rst_n(rst_n), .t(1'b1), .q(q[2]));
    T_FF t3 (.clk(q[2]),   .rst_n(rst_n), .t(1'b1), .q(q[3]));
endmodule


// T Flip-Flop Module
module T_FF (
    input clk,
    input rst_n,
    input t,
    output reg q
);
    always @(negedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;
        else if (t)
            q <= ~q;
    end
endmodule
