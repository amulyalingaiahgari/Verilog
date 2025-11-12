module siso_using_jk (
  input clk,
  input rst_n,
  input sin,         // Serial input
  output reg [3:0] q // Serial output (MSB is last stage)
);
  // Internal wires for J and K inputs for each stage
  wire [3:0] j, k;

  // Define J and K inputs for each flip-flop
  assign j[0] = sin;
  assign k[0] = ~sin;
  assign j[1] = q[0];
  assign k[1] = ~q[0];
  assign j[2] = q[1];
  assign k[2] = ~q[1];
  assign j[3] = q[2];
  assign k[3] = ~q[2];

  // Sequential block for JK FF behavior
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      q <= 4'b0000;
    else begin
      q[0] <= (j[0] & ~q[0]) | (~k[0] & q[0]);  // JK FF formula
      q[1] <= (j[1] & ~q[1]) | (~k[1] & q[1]);
      q[2] <= (j[2] & ~q[2]) | (~k[2] & q[2]);
      q[3] <= (j[3] & ~q[3]) | (~k[3] & q[3]);
    end
  end
endmodule
