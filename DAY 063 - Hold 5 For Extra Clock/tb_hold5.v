module tb_h5;
  reg clk;
  reg rst;
  wire [2:0]y; //wire [3:0]y; //for holding 8

  h5 uut(clk, rst, y);
  always #2 clk = ~clk;
  
  initial begin
    $monitor("time:%0d, output:%0d", $time, y);
    clk=0;
    rst=1;
    #4 rst=0;
    #30 $finish;
  end
endmodule
