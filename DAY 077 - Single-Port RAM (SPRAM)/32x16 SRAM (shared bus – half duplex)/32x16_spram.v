module mem (
    input              clk,
    input              rst,
    input              r_w,         // 1=write , 0=read
    input      [4:0]   addr,
    input      [15:0]  d_in,
    output reg [15:0]  d_out
);

    reg [15:0] memory [0:31];   // 32 x 16 RAM

    always @(posedge clk) begin
        if (rst) begin
            d_out <= 16'h0000;
        end
        else begin
            if (r_w) begin
                memory[addr] <= d_in;    // WRITE
            end
            else begin
                d_out <= memory[addr];   // READ
            end
        end
    end

endmodule
