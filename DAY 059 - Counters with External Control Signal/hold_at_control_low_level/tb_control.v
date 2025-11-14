module tbdc ();
  reg clk;
  reg rst;
  reg control;
  wire [3:0]count;
  
  dch uut(count, clk, rst, control);
  always #2 clk = ~clk;
  initial
  begin
    clk=0;
    rst=1;
    control=1;
    #4 rst=0;
    #40 control=0;
    #15 control=1;
    #10 $finish;
  end
endmodule
