module tb_bi_dir_shift_reg;
  reg clk, rst_n, dir, sin;
  wire [3:0] q;

  // Instantiate DUT
  bi_dir_shift_reg uut (.clk(clk), .rst_n(rst_n), .dir(dir), .sin(sin), .q(q));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Time | Dir | Sin | Q");
    $monitor("%0t | %b | %b | %b", $time, dir, sin, q);

    clk = 0;
    rst_n = 0;
    dir = 0;
    sin = 0;

    #10 rst_n = 1;

    // Right Shift
    dir = 0;
    sin = 1; #10;
    sin = 0; #10;
    sin = 1; #10;

    // Left Shift
    dir = 1;
    sin = 0; #10;
    sin = 1; #10;
    sin = 1; #10;

    $finish;
  end
endmodule
