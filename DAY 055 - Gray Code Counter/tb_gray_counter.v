module tb_gray_counter;
  reg clk, rst_n;
  wire [3:0] gray;

  gray_counter dut (.clk(clk), .rst_n(rst_n), .gray(gray));

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;

    $display("Time\tclk\trst_n\tGray");
    $monitor("%0t\t%b\t%b\t%b", $time, clk, rst_n, gray);

    #10 rst_n = 1;

    repeat (20) @(posedge clk);

    $finish;
  end
endmodule
