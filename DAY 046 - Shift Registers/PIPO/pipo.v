module pipo (data_out, clk, rst, data_in) ;
  input clk;
  input rst;
  input [3:0]data_in;
  output [3:0]data_out;
  
  reg [3:0]shift_reg;
  
  always @(posedge clk) begin
    if(rst)
      shift_reg <= 0;
    else
    shift_reg <= data_in;
  end
  
  assign data_out=shift_reg;
endmodule
