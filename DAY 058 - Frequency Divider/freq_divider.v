module frequency_divider(
  input clk,
  input rst,
  output reg div2,
  output reg div4,
  output reg div8
);

  always @(posedge clk or negedge rst) begin
    if(!rst)
      div2 <= 0;
    else
      div2 <= ~div2;
  end

  always @(posedge div2 or negedge rst) begin
    if(!rst)
      div4 <= 0;
    else
      div4 <= ~div4;
  end

  always @(posedge div4 or negedge rst) begin
    if(!rst)
      div8 <= 0;
    else
      div8 <= ~div8;
  end

endmodule
