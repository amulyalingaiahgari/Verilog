module tb_mux8x1_using_4x1;

    reg  [7:0] in;
    reg  [2:0] sel;
    wire out;

    // DUT instantiation
    mux8x1_using_4x1 dut (.in(in), .sel(sel), .out(out));

    initial begin
        $display("Time | sel | in[7:0] | out");
        $display("-----------------------------");

        in = 8'b10110011;   // sample input

        for (integer i = 0; i < 8; i = i + 1) begin
            sel = i[2:0];   // select value
            #10 $display("%4t | %b | %b | %b", $time, sel, in, out);
        end

        #10 $finish;
    end

endmodule
