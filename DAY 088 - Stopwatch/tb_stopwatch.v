module tb_stop_watch();
  reg clk, rst;
  reg start_stop;
  wire [5:0] sec, min;
  wire [3:0] hour;

  stop_watch dut(clk, rst, start_stop, sec, min, hour);

  always #2 clk = ~clk;    // 250 MHz simulation clock

  initial begin
    $monitor("Time=%0t | %0d:%0d:%0d", $time, hour, min, sec);

    clk = 0;
    rst = 1;
    start_stop = 0;

    #4 rst = 0;

    // Start
    start_stop = 1;
    #4 start_stop = 0;

    #100;

    // Stop
    start_stop = 1;
    #4 start_stop = 0;

    #80;

    // Start again
    start_stop = 1;
    #4 start_stop = 0;

    #500 $finish;
  end

endmodule
