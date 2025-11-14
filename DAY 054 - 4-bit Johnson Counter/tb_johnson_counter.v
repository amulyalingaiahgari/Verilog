module tb_johnson;
  reg clk, rst_n;
  wire [3:0] q;

  johnson_counter dut (.clk(clk), .rst_n(rst_n), .q(q));

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;

    $display("Time\tclk\trst_n\tq");
    $monitor("%0t\t%b\t%b\t%b", $time, clk, rst_n, q);

    #10 rst_n = 1;

    repeat (20) @(posedge clk);

    $finish;
  end
endmodule
