module tbmul3;
  reg clk;
  reg rst;
  wire [16:0]count;

  m3 uut (count,clk,rst);
  always #1 clk=~clk;
  initial begin
    clk=0;
    rst=1;
    #2 rst=0;
    #250000 $finish;
  end
endmodule
