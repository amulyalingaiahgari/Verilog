// 4-bit Down Counter
module down_counter (
    input clk,
    input rst_n,
    output reg [3:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 4'b1111;      // start from max
        else
            count <= count - 1'b1; // decrement
    end
endmodule
