module tb_mux_kx1;

  // Parameter (change this to 4, 8, 16, etc.)
  parameter K = 5;

  // Testbench signals
  reg  [K-1:0] in;
  reg  [$clog2(K)-1:0] sel;
  wire out;

  // DUT instantiation
  mux_kx1 #(K) dut (.in(in), .sel(sel), .out(out));

  // Test procedure
  initial begin
    $display("===== TESTING %0d x 1 MUX =====", K);
    $monitor("Time=%0t | in=%b | sel=%0d | out=%b", $time, in, sel, out);

    // Initialize inputs
    in = 0;
    sel = 0;

    // Apply random input pattern
    in={$random}%K;   // Example for 8-bit input
    #5;

    // Loop through all select values
    for (integer i = 0; i < K; i = i + 1) begin
      sel = i;
      #10;  // Wait 10ns between tests
    end

    $display("===== TEST COMPLETE =====");
    $finish;
  end

endmodule
