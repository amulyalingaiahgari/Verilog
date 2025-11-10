module tb_low_priority_encoder_8x3;
    reg  [7:0] in;
    wire [2:0] out;
    wire valid;
    integer i;

    low_priority_encoder_8x3 dut (.in(in),.out(out),.valid(valid));

    initial begin
        $display("Time | Input        | Output | Valid");
        $display("--------------------------------------");

        in = 8'b00000000;  // no active bits
        #5;
        $display("%0t | %b |   %b   |   %b <-- default case", $time, in, out, valid);
        #5;

        //  Random test cases
        for (i = 0; i < 10; i = i + 1) begin
            in = $random;   // generate random 8-bit input
            #5;
            $display("%0t | %b |   %b   |   %b", $time, in, out, valid);
            #5;
        end
        $finish;
    end
endmodule
