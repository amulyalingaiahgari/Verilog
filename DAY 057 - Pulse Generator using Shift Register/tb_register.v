module tb_pulse_generator;
  reg clk, rst_n, trigger;
  wire pulse;

  pulse_generator dut(clk, rst_n, trigger, pulse);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    trigger = 0;

    #10 rst_n = 1;

    // Generate first pulse
    #10 trigger = 1;
    #10 trigger = 0;

    // After some time, generate second pulse
    #50 trigger = 1;
    #10 trigger = 0;

    #100 $finish;
  end

  initial begin
    $display("Time\tClk\tTrig\tPulse\tShiftReg");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, trigger, pulse, dut.shift_reg);
  end
endmodule
