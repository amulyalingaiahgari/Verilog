module t_d (q,clk, rst,d);
  input clk;
  input rst;
  input d;
  output reg q;
  reg t;
  
  always @(*) begin
    t <= d^q;
  end
    always @(posedge clk) begin
      if (rst)
        q <= 0;
      else begin
        if(t)
          q <=~ q;
        else
        q <= q:
      end
   end
endmodule
