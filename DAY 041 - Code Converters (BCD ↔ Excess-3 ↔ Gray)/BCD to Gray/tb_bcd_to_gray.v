module tb_bcd_to_gray;
    reg  [3:0] bcd;
    wire [3:0] gray;

    bcd_to_gray dut(.bcd(bcd), .gray(gray));

    initial begin
        $monitor("Time=%0t | BCD=%b | Gray=%b", $time, bcd, gray);
        bcd = 4'd0; #5;
        bcd = 4'd3; #5;
        bcd = 4'd5; #5;
        bcd = 4'd9; #5;
        $finish;
    end
endmodule
