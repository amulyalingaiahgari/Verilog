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
    repeat(4) @(posedge clk);
    rst=0;
    repeat (5) @(posedge clk);
    press=1;
    repeat(15) @(posedge clk);
    press=0;
    repeat(10) @(posedge clk);
    press=1;
    repeat(10) @(posedge clk);
    press=0;
    repeat(10) @(posedge clk);
    press=1;
    repeat (100) @(posedge clk)
    $finish;
  end
endmodule
