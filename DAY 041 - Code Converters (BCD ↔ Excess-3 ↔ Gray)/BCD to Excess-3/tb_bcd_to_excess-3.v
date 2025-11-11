module tb_bcd_to_excess3;
    reg  [3:0] bcd;
    wire [3:0] ex3;

    bcd_to_excess3 dut(.bcd(bcd), .ex3(ex3));

    initial begin
        $monitor("Time=%0t | BCD=%d | Excess-3=%d", $time, bcd, ex3);
        bcd = 4'd0; #5;
        bcd = 4'd4; #5;
        bcd = 4'd7; #5;
        bcd = 4'd9; #5;
        $finish;
    end
endmodule
