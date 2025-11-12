module bi_dir_shift_reg (
  input clk,
  input rst_n,
  input dir,             // Direction: 0 = right shift, 1 = left shift
  input sin,             // Serial input (for shifting)
  output reg [3:0] q     // 4-bit shift register output
);
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      q <= 4'b0000;
    else begin
      if (dir == 1'b0)
        q <= {sin, q[3:1]};   // Right shift
      else
        q <= {q[2:0], sin};   // Left shift
    end
  end
endmodule
