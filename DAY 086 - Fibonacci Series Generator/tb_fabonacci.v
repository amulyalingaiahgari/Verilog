module tb_fibonacci;
  reg clk, rst;
  wire [31:0] present, next;

  // DUT instantiation
  fibonacci dut (.clk(clk), .rst(rst), .present(present), .next(next));

  // Clock generation
  always #2 clk = ~clk;

  initial begin
    // Display signal values continuously
    $monitor("time=%0t | present=%0d | next=%0d",
              $time, present, next);

    clk = 0;
    rst = 1;

    #4 rst = 0;     // Release reset

    #300 $finish;   // Stop simulation
  end

endmodule
