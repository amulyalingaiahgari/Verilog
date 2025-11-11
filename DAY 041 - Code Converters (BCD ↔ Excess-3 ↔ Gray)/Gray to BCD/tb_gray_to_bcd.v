module tb_gray_to_bcd;
    reg  [3:0] gray;
    wire [3:0] bcd;

    gray_to_bcd dut(.gray(gray), .bcd(bcd));

    initial begin
        $monitor("Time=%0t | Gray=%b | BCD=%b", $time, gray, bcd);
        gray = 4'b0000; #5;
        gray = 4'b0011; #5;
        gray = 4'b0111; #5;
        gray = 4'b1101; #5;
        $finish;
    end
endmodule
