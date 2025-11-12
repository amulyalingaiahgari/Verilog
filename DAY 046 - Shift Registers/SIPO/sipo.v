module sipo (data_out, clk, rst, data_in);
  input clk;
  input rst;
  input data_in;
  output reg [3:0]data_out;

  reg [3:0]shift_reg;

  always @(posedge clk) begin
    if(rst)
      shift_reg <= 0;
    else
    shift_reg <= {data_in, shift_reg[3:1]};
    data_out <= shift_reg;
  end
endmodule
