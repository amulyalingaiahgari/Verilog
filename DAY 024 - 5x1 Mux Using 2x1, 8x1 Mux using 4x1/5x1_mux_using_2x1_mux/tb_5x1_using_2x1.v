module tb_mux5x1_minmux;

    reg  [4:0] in;
    reg  [2:0] sel;
    wire out;

    mux5x1 dut (.in(in), .sel(sel), .out(out));

    initial begin
        $display("Time | sel | in[4:0] | out");
        $display("----------------------------");

        in = 5'b11101;

        for (sel = 0; sel < 5; sel = sel + 1) begin
            #10 $display("%4t | %b | %b | %b", $time, sel, in, out);
        end

        #10 $finish;
    end

endmodule
