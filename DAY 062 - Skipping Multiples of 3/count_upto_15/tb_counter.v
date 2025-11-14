module tbm3;
  reg clk;
  reg rst;
  wire [3:0]result;
  m3 uut(result,clk,rst);
  always #2 clk = ~clk;
  initial
    begin
      clk=0;
      rst=1;
      #4 rst=0;
      #50 rst=1;
      #5 rst=0;
      #200 $finish;
    end
endmodule
