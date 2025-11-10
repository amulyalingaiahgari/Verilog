module tb_binary_to_gray;
    reg  [3:0] bin;
    wire [3:0] gray;

    binary_to_gray dut(.bin(bin), .gray(gray));

    initial begin
        $monitor("Time=%0t | Binary=%b | Gray=%b", $time, bin, gray);

        bin = 4'b0000; #5;
        bin = 4'b0001; #5;
        bin = 4'b0010; #5;
        bin = 4'b0100; #5;
        bin = 4'b1111; #5;
        bin = 4'b1010; #5;
        $finish;
    end
endmodule
