module tbcode;
  reg clk;
  reg rst;
  wire [3:0]result;

  code dut (result,clk,rst);
  always #2 clk = ~clk;

  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    #300 $finish;
  end

endmodule
