module tb_excess3_to_gray;
    reg  [3:0] ex3;
    wire [3:0] gray;

    excess3_to_gray dut(.ex3(ex3), .gray(gray));

    initial begin
        $monitor("Time=%0t | Excess-3=%b | Gray=%b", $time, ex3, gray);
        ex3 = 4'd3;  #5;
        ex3 = 4'd5;  #5;
        ex3 = 4'd8;  #5;
        ex3 = 4'd12; #5;
        $finish;
    end
endmodule
