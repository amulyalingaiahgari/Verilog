module tb_ripple_counter;
    // Testbench signals
    reg clk;
    reg rst_n;
    wire [3:0] q;

    // Instantiate DUT
    ripple_counter uut ( .clk(clk), .rst_n(rst_n), .q(q));

    // Clock generation: 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Initialize
        rst_n = 0;
        #10;
        
        // Release reset
        rst_n = 1;
        
        // Run for some time to observe counting
        #200;

        // Apply reset again
        rst_n = 0;
        #10;
        rst_n = 1;

        // Run again
        #100;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | q = %b | Decimal = %0d", $time, q, q);
    end

endmodule
