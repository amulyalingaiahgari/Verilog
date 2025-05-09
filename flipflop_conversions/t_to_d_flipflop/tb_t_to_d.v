module tbt_d;
  reg clk;
  reg rst;
  reg d;
  wire q;
  
  t_d uut (q,clk,rst,d);
  always #2 clk =~ clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    //@(posedge clk)begin
    d=0:
    #5 d=1;
    #5 d=0;
    #5 d=1;
    //end
    #5 $finish;
  end
endmodule
