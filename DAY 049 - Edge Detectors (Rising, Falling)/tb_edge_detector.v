module tb_edge_detector;
  reg clk, rst_n, sig;
  wire rise_pulse, fall_pulse;

  // Instantiate DUT
  edge_detector dut (.clk(clk), .rst_n(rst_n), .sig(sig), .rise_pulse(rise_pulse), .fall_pulse(fall_pulse));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $display("Time\tclk\tsig\trise\tfall");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, sig, rise_pulse, fall_pulse);

    clk = 0; rst_n = 0; sig = 0;
    #10 rst_n = 1;

    // Stimulus — random toggles
    #10 sig = 1;  // Rising edge
    #20 sig = 0;  // Falling edge
    #10 sig = 1;  // Rising edge
    #10 sig = 0;  // Falling edge
    #20 sig = 1;  // Rising edge again

    #20 $finish;
  end
endmodule
