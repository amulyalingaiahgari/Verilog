module dch (count, clk, rst, control) ;
  input control;
  input clk;
  input rst;
  output reg [3:0]count;
  
  always @(posedge clk) begin
    if (rst)
      count <= 0;
    else
    if (control)
      count <= (count+1);
    else
    count <= count;
  end
endmodule

//when control is high --- increment
//when control is low --- hold
