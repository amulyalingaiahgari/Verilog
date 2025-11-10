module encoder_tb;
    reg  [3:0] din4;
    wire [1:0] dout4;

    encoder_4x2 e1(.din(din4), .dout(dout4));

    initial begin
        $display("Input\tOutput");
        for (integer i = 0; i < 4; i = i + 1) begin
            din4 = 1 << i;
            #5;
            $display("%b\t%b", din4, dout4);
        end
        $finish;
    end
endmodule
