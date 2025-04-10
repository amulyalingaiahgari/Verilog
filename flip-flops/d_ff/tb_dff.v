module tb;
  reg clk, rst_n;
  reg d;
  wire q;
  
  d_ff ff(clk, rst_n, d, q);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0;
    rst_n = 0;
    d = 0;
    #3 rst_n = 1;
    
    repeat(6) begin
     #3 d = {random}%2;
    end
    rst_n = 0; 
    #3 rst_n = 1;
    repeat(6) begin
     #3 d = {random}%2;
    end
    $finish;
  end
endmodule
