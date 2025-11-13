module tb_universal_shift_register;
    reg [3:0] P_in;
    reg SLin, SRin;
    reg [1:0] mode;
    reg clk, rst_n;
    wire [3:0] P_out;

    universal_shift_register uut ( .P_in(P_in), .SLin(SLin), .SRin(SRin), .mode(mode), .clk(clk), .rst_n(rst_n), .P_out(P_out));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; P_in = 4'b0000; SLin = 0; SRin = 0; mode = 2'b00;
        #10 rst_n = 1;

        // Parallel Load
        P_in = 4'b1010; mode = 2'b11; #10;

        // Hold
        mode = 2'b00; #10;

        // Shift Right
        SRin = 1; mode = 2'b01; #10;

        // Shift Left
        SLin = 0; mode = 2'b10; #10;

        // Shift Left again with SLin=1
        SLin = 1; mode = 2'b10; #10;

        // Hold again
        mode = 2'b00; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Mode=%b | SLin=%b SRin=%b | P_in=%b | P_out=%b", $time, mode, SLin, SRin, P_in, P_out);
    end
endmodule
