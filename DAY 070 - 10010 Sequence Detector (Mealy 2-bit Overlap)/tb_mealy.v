module tb_seq_11011_mealy;
  reg clk, rst, x;
  wire y;

  // DUT Instance
  seq_11011_mealy dut (.clk(clk), .rst(rst), .x(x), .y(y));

  // Clock generator
  always #5 clk = ~clk;

  // Apply input sequence
  initial begin
    clk = 0;
    rst = 1;
    x   = 0;

    #10 rst = 0;

    // Example sequence with expected 11011 detections
    // Sequence: 11011011011
    // Should detect 3 times (positions ending at bits 5, 7, 11)

    $display("\nTime   x   y   State");

    repeat(20) begin
      #10;
      x = $random % 2;   // Random input
      $display("%0t     %b   %b", $time, x, y);
    end

    #20 $finish;
  end

endmodule
