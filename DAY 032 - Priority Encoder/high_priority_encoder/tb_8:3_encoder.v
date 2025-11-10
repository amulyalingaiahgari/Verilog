module tb_priority_encoder_8x3;
    reg  [7:0] in;
    wire [2:0] out;
    wire valid;

    priority_encoder_8x3 dut (.in(in), .out(out), .valid(valid));

    initial begin
        $display("Time| Input    | Output | Valid");
        $display("----------------------------------------");

        in = 8'b00000000; #10;
        $display("%0t | %b |  %b   |  %b", $time, in, out, valid);

        in = 8'b00000001; #10;
        $display("%0t | %b |  %b   |  %b", $time, in, out, valid);

        in = 8'b00000100; #10;
        $display("%0t | %b |  %b   |  %b", $time, in, out, valid);

        in = 8'b01010101; #10;
        $display("%0t | %b |  %b   |  %b", $time, in, out, valid);

        in = 8'b10000000; #10;
        $display("%0t | %b |  %b   |  %b", $time, in, out, valid);

        in = 8'b11111111; #10;
        $display("%0t | %b |  %b   |  %b", $time, in, out, valid);

        $finish;
    end
endmodule
