module tbrtl;
  reg clk;
  reg rst;
  reg press;
  wire [3:0]count;

  rtl dut (count, clk, rst, press);
  always #2 clk = ~clk;

  initial begin
    clk=0;
    rst=1;
    press=0;
    #4 rst=0;
    #5 press=1;
    #40 press=0;
    #10 press=1;
    #10 press=0;
    #10 press=1;
    #10 $finish;
  end
endmodule
