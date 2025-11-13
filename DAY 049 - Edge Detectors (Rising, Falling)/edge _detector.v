module edge_detector (
  input clk,
  input rst_n,
  input sig,
  output reg rise_pulse,
  output reg fall_pulse
);
  reg prev;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      prev <= 0;
    else
      prev <= sig;
  end

  always @(*) begin
    rise_pulse = sig & ~prev;   // Rising edge
    fall_pulse = ~sig & prev;   // Falling edge
  end
endmodule
