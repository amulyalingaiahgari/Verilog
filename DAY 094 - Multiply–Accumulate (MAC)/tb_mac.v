module tb_mac();
    parameter WIDTH = 8;

    logic clk, rst, en;
    logic [WIDTH-1:0] A, B;
    logic [(2*WIDTH)-1:0] ACC;

    mac_unit #(WIDTH) dut(clk, rst, en, A, B, ACC);

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; en = 0; A = 0; B = 0;
        #10 rst = 0;

        // ---------------------------
        // PASS TEST CASE
        //  ACC = 0 + (5 * 3) = 15
        // ---------------------------
        en = 1; A = 5; B = 3;
        #10;
        if (ACC == 15)
            $display("PASS: 5 * 3 accumulated correctly = %0d", ACC);
        else
            $display("FAIL: Expected 15 but got %0d", ACC);

        // ---------------------------
        // Another accumulation
        // ACC = 15 + (2 * 4) = 23
        // ---------------------------
        A = 2; B = 4;
        #10;

        if (ACC == 23)
            $display("PASS: Accumulator updated correctly = %0d", ACC);
        else
            $display("FAIL: Expected 23 but got %0d", ACC);

        #20 $finish;
    end
endmodule
