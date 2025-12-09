module tb_top_traffic_stopwatch;

    reg clk;
    reg reset;
    reg start_stop;

    wire [2:0] light;
    wire [5:0] sec;
    wire [5:0] min;
    wire [3:0] hour;

    // Instantiate DUT
    combo_system DUT (
        .clk(clk),
        .rst(reset),
        .start_stop(start_stop),
        .light(light),
        .sec(sec),
        .min(min),
        .hour(hour)
    );

    // Clock => 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        start_stop = 0;

        // Apply reset
        #20 reset = 0;

        // Start stopwatch
        #30 start_stop = 1;
        #10 start_stop = 0;

        // Let stopwatch run 200ns
        #200;

        // Stop stopwatch
        #20 start_stop = 1;
        #10 start_stop = 0;

        // Hold
        #200;

        // Start again
        #30 start_stop = 1;
        #10 start_stop = 0;

        #200;

        $finish;
    end

    // Monitor
    initial begin
      $monitor("T=%0t | Light=%b | %0d:%0d:%0d | run=%b", $time, light, hour, min, sec, DUT.run);
    end

endmodule
