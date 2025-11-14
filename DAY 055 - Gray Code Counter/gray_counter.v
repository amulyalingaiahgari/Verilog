module gray_counter (
  input clk,
  input rst_n,
  output reg [3:0] gray
);

  reg [3:0] binary;  // internal binary count

  // Binary counter
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      binary <= 4'b0000;
    else
      binary <= binary + 1;
  end

  // Binary -> Gray conversion
  always @(*) begin
    gray[3] = binary[3] ^ binary[2];
    gray[2] = binary[2] ^ binary[1];
    gray[1] = binary[1] ^ binary[0];
    gray[0] = binary[0];
  end
endmodule
