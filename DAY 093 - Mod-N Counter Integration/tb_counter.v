module tb_mod_n_counter;
    parameter N = 10;
    parameter WIDTH = 4;

    reg clk, rst, en;
    wire event_pulse;

    mod_n_integration #(
        .N(N),
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .enable(en),
        .event_pulse(event_pulse)
    );

    // 100 MHz clock
    always #5 clk = ~clk;

    integer cycle;

    initial begin
        $display("=== Mod-N Counter Integration Test ===");

        clk = 0;
        rst = 1;
        en  = 0;
        #20;
        rst = 0;
        en  = 1;

        for (cycle = 0; cycle < 30; cycle = cycle + 1) begin
            @(posedge clk);
            if (event_pulse)
                $display("TIME=%0t | EVENT PULSE (MOD-%0d)", $time, N);
            else
                $display("TIME=%0t | count running...", $time);
        end

        $display("=== TEST COMPLETE ===");
        $finish;
    end

endmodule
