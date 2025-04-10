module tb;
  reg clk, rst_n;
  reg t;
  wire q, q_bar;
  
  T_flipflop dff (clk, rst_n, t, q, q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; 
    rst_n = 0;
    #4 rst_n=1;
    repeat(10) @(posedge clk) begin
      #4 t={random}%2;
    end
    #4 $finish;
  end
endmodule
