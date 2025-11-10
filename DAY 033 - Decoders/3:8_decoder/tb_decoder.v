module tb_decoder_3x8;
    reg  [2:0] in;
    reg        en;
    wire [7:0] out;

    // DUT instance
    decoder_3x8 dut ( .in(in), .en(en), .out(out) );

    integer i;

    initial begin
        $display("Time(ns) | Enable | Input | Output");
        $display("-----------------------------------");

        en = 1'b0; in = 3'b000; #10;
        $display("%0t |   %b    |  %b   | %b", $time, en, in, out);

        en = 1'b1;
        for (i = 0; i < 8; i = i + 1) begin
            in = i; #10;
            $display("%0t |   %b    |  %b   | %b", $time, en, in, out);
        end

        en = 1'b0; in = 3'b101; #10;
        $display("%0t |   %b    |  %b   | %b", $time, en, in, out);

        $finish;
    end
endmodule
