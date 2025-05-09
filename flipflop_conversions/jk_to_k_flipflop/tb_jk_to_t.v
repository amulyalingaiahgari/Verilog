module tbjk_t;
  reg clk;
  reg rst;
  reg t;
  wire q;
  
  jk_t (q,clk,rst,t);
  always #2 clk =~ clk;
  initial begin
    clk=0;
    rst=1;
    t=1;
    #4 rst=0;
    #4 t=0;
    #4 t=1;
    #4 t=0;
    #5 $finish;
  end
endmodule
