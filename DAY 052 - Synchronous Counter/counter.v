module sync_counter #(
  parameter N = 4       // Counter width
)(
  input  wire clk,
  input  wire rst_n,
  input  wire en,       // Enable
  output reg  [N-1:0] count
);

  always @(posedge clk) begin
    if (!rst_n)
      count <= 0;
    else if (en)
      count <= count + 1;
  end
endmodule
