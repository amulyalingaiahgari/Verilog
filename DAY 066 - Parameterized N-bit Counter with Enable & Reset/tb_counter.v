module tb_nbit_counter;
    parameter N = 4;

    reg clk, rst_n, en;
    wire [N-1:0] count;

    nbit_counter #(N) dut ( .clk(clk), .rst_n(rst_n), .en(en), .count(count));

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        en = 0;

        #10 rst_n = 1;     // Release reset
        repeat(3) @(posedge clk);
      
        #10 en = 1;        // Enable counting
        repeat(15) @(posedge clk);

        en = 0;            // Stop counting
        repeat(5) @(posedge clk);

        en = 1;            // Start again
        repeat(10) @(posedge clk);

        $finish;
    end

    initial
        $monitor("time=%0t  rst_n=%b en=%b count=%0d (%b)",$time, rst_n, en, count, count);
endmodule

