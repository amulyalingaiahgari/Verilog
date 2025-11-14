module tb_sync_counter;
  reg clk, rst_n, en;
  wire [3:0] count;

  sync_counter #(4) dut (.clk(clk), .rst_n(rst_n), .en(en), .count(count));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    en = 0;

    // Display header
    $display("Time\tclk\trst_n\ten\tcount");

    // Monitor values on every change
    $monitor("%0t\t%b\t%b\t%b\t%0d", $time, clk, rst_n, en, count);

    #12 rst_n = 1;

    en = 1;
    repeat (20) @(posedge clk);

    en = 0;
    repeat (5) @(posedge clk);

    $finish;
  end
endmodule
