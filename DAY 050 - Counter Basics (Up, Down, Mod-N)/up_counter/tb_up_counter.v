module tb_counter;
    reg clk, rst_n;
    wire [3:0] up_out;

    // Instantiate counter
    up_counter u1 (.clk(clk), .rst_n(rst_n), .count(up_out));
    
  // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        #10 rst_n = 1;
        #200 $finish;
    end

    initial begin
      $monitor("Time=%0t | Up=%d", $time, up_out);
    end
endmodule
