module tb_excess3_to_bcd;
    reg  [3:0] ex3;
    wire [3:0] bcd;

    excess3_to_bcd dut(.ex3(ex3), .bcd(bcd));

    initial begin
        $monitor("Time=%0t | Excess-3=%d | BCD=%d", $time, ex3, bcd);
        ex3 = 4'd3; #5;
        ex3 = 4'd7; #5;
        ex3 = 4'd10; #5;
        ex3 = 4'd12; #5;
        $finish;
    end
endmodule
