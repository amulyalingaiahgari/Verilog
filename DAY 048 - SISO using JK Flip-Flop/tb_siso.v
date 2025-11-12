module tb_siso_using_jk;
  reg clk, rst_n, sin;
  wire [3:0] q;

  // DUT instantiation
  siso_using_jk uut (.clk(clk), .rst_n(rst_n), .sin(sin), .q(q));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Time | clk | sin | q");
    $monitor("%0t | %b | %b | %b", $time, clk, sin, q);

    clk = 0; rst_n = 0; sin = 0;
    #10 rst_n = 1;

    // Serial data input stream
    sin = 1; #10;
    sin = 0; #10;
    sin = 1; #10;
    sin = 1; #10;
    sin = 0; #10;

    $finish;
  end
endmodule

