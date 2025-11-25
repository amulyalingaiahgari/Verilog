module tb_digital_clock;
    reg clk, rst_n;
    wire [5:0] ss, mm;
    wire [4:0] hh;

    // Instantiate DUT
    digital_clock dut(clk, rst_n, ss, mm, hh);

    // Generate 1 Hz clock (simulate faster)
    always #5 clk = ~clk;  // 10ns period → 100MHz

    initial begin
        clk = 0;
        rst_n = 0;

        #20 rst_n = 1;

        // Let it run for few cycles
        repeat(200) @(posedge clk);

        $finish;
    end

    initial begin
        $monitor("Time=%0t | %0d:%0d:%0d", $time, hh, mm, ss);
    end
endmodule
