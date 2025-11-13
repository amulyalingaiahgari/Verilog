module tb_counter;

    reg clk, rst_n;
    wire [3:0] mod_out;

    // Instantiate counter
     modN_counter #(.N(10), .WIDTH(4)) u3 (.clk(clk), .rst_n(rst_n), .count(mod_out));

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        #10 rst_n = 1;
        #150 $finish;
    end

    initial begin
       $monitor("Time=%0t | ModN=%d", $time, mod_out);
    end
endmodule
