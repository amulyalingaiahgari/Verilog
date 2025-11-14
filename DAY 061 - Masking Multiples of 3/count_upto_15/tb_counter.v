module tbmul3;
  reg clk;
  reg rst;
  wire [3:0]count;

  m3 uut (count,clk,rst);
  always #2 clk=~clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    #40 $finish;
  end
endmodule
