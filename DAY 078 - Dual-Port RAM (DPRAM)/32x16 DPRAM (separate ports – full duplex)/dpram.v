module mem (
  input         clk,
  input         rst,
  input         rd,
  input         wr,
  input  [4:0]  raddr,
  input  [4:0]  waddr,
  input  [15:0] d_in,
  output reg [15:0] d_out
);

  reg [15:0] memory [0:31];   // 32 x 16 RAM  
  integer i;

  always @(posedge clk) begin
    // Reset – clear entire memory and output
    if (rst) begin
      d_out <= 16'b0;
      for (i = 0; i < 32; i = i + 1)
        memory[i] <= 16'b0;
    end
    // Write operation
    else if (wr) begin
      memory[waddr] <= d_in;
    end
    // Read operation
    else if (rd) begin
      d_out <= memory[raddr];
    end
    // Idle: No action
  end
endmodule
