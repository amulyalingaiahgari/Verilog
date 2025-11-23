module tb_seq_11011_moore_2overlap();
    reg clk, reset, din;
    wire dout;

    // Instantiate DUT
    seq_11011_moore_2overlap dut (.clk(clk), .reset(reset), .din(din), .dout(dout));

    // Clock Generation - 10ns period
    always #5 clk = ~clk;

    // Input sequence
    reg [31:0] stimulus = 32'b00011111101101101010111;
    integer i;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        din = 0;

        // Apply reset
        #12;
        reset = 0;

        // Apply bit stream
        for (i = 31; i >= 0; i = i - 1) begin
            din = stimulus[i];
            #10;
        end

        #20;
        $finish;
    end

    // Monitor output
    initial begin
        $display("Time | din | dout");
        $monitor("%4t |  %b  |  %b", $time, din, dout);
    end

endmodule
