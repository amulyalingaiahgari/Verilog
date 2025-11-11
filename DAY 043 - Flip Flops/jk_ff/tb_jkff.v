module tb;
  reg clk, rst_n;
  reg j, k;
  wire q, q_bar;
  
  JK_flipflop ff(clk, rst_n, j, k, q, q_bar);
  
  always #2 clk = ~clk;
    initial begin
    clk = 0; 
    rst_n = 0;
    #4 rst_n =1;
    repeat(10) @(posedge clk) begin
      #4 j = {random}%2;
      k = {random}%2;
    end
    #4 $finish;
  end
endmodule
