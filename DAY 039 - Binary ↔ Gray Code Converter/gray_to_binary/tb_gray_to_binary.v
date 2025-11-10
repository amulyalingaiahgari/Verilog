module tb_gray_to_binary;
    reg  [3:0] gray;
    wire [3:0] bin;

    gray_to_binary dut(.gray(gray), .bin(bin));

    initial begin
        $monitor("Time=%0t | Gray=%b | Binary=%b", $time, gray, bin);

        gray = 4'b0000; #5;
        gray = 4'b0001; #5;
        gray = 4'b0011; #5;
        gray = 4'b0110; #5;
        gray = 4'b1111; #5;
        gray = 4'b1010; #5;
        $finish;
    end
endmodule
