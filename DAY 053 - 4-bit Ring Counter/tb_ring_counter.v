module tb_ring_counter;
  reg clk, rst_n;
  wire [3:0] q;

  ring_counter dut ( .clk(clk), .rst_n(rst_n), .q(q));

  // clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;

    // Header
    $display("Time\tclk\trst_n\tq");

    // Monitor
    $monitor("%0t\t%b\t%b\t%b", $time, clk, rst_n, q);

    #12 rst_n = 1;

    repeat (20) @(posedge clk);

    $finish;
  end
endmodule
