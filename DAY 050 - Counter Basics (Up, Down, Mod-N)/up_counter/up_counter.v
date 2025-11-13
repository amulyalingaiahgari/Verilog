// 4-bit Up Counter
module up_counter (
    input clk,
    input rst_n,      // active-low reset
    output reg [3:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 4'b0000;      // reset to 0
        else
            count <= count + 1'b1; // increment
    end
endmodule
