module tb;
  reg clk, rst_n;
  reg s, r;
  wire q, q_bar;
  
  SR_flipflop ff(clk, rst, s, r, q, q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; 
    rst = 1;
    #4 rst =0;
    repeat(10) @(posedge clk) begin
      #4 s = {random}%2;
      r = {random}%2;
    end
    #4 $finish;
  end
endmodule
