module frequency_divider_tb;
  reg clk, rst;
  wire div2, div4, div8;

  frequency_divider dut(clk, rst, div2, div4, div8);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;

    @(negedge clk) rst = 0;
    @(negedge clk) rst = 1;

    #200 $finish;
  end

  initial 
    $monitor("T=%0t | div2=%b div4=%b div8=%b",$time, div2, div4, div8);
endmodule
