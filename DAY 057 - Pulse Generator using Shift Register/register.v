module pulse_generator (
  input clk,
  input rst_n,
  input trigger,        // generates pulse when trigger = 1
  output pulse
);

  reg [3:0] shift_reg;

  // Shift Register Logic
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      shift_reg <= 4'b0000;
    else if (trigger) 
      shift_reg <= 4'b0001;      // Load pulse
    else 
      shift_reg <= {shift_reg[2:0], 1'b0};  // Shift left
  end

  // Pulse appears at MSB
  assign pulse = shift_reg[3];
endmodule
