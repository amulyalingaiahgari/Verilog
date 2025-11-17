module tb_arbiter;
    reg clk, rst;
    reg  [2:0] request;
    wire [2:0] grant;

    // DUT
    arbiter dut (.clk(clk),.rst(rst),.request(request),.grant(grant));

    // Clock generator (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset block
    initial begin
        rst = 1;
        request = 3'b000;
        #20;
        rst = 0;
    end

    // Monitor
    initial begin
       $display("  TIME    REQ   GRANT   STATE");
       $monitor("%6t   %b     %b    %d", $time, request, grant,dut.state);
    end

    // Stimulus
    initial begin
        // 1. Directed tests
        // Request only 0
        #10 request = 3'b001;   // Expect grant = 001
        #20 request = 3'b000;

        // Request only 1
        #20 request = 3'b010;   // Expect grant = 010
        #20 request = 3'b000;

        // Request only 2
        #20 request = 3'b100;   // Expect grant = 100
        #20 request = 3'b000;

      
        // 2. Round-robin behavior test (multiple requests at once)
        // Cycle 1 → all requests high → expect grant0 (001)
        #20 request = 3'b111;

        // Cycle 2 → next priority → expect grant1 (010)
        #20 request = 3'b111;

        // Cycle 3 → next priority → expect grant2 (100)
        #20 request = 3'b111;

        #20 request = 3'b000;
        
      
        // 3. Random request pattern
        repeat (10) begin
            #20 request = $random;
        end
        #10;
        $finish;
    end
endmodule
