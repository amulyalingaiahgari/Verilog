module tb_counter;

    reg clk, rst_n;
    wire [3:0] down_out;
   
    // Instantiate counter
    down_counter u2 (.clk(clk), .rst_n(rst_n), .count(down_out));
   
    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        #10 rst_n = 1;
        #200 $finish;
    end

    initial begin
      $monitor("Time=%0t | Down=%d", $time, down_out);
    end
endmodule
