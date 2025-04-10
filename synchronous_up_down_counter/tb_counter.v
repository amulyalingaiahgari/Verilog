module tb;
  reg clk, rst_n;
  reg up/down;
  wire [3:0] count;
  
  synchronous_counter(clk, rst_n, up/down, count);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; rst_n = 0; 
    up/down = 1;
    #4 rst_n = 1;
    #80 rst_n = 0;
    #4 rst_n = 1; up/down = 0;
    #50 $finish;
  end

endmodule
