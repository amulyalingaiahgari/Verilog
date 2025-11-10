module full_subtractor_using_demux_tb;
    reg a, b, bin;
    wire diff, bout;

    full_subtractor_using_demux dut( .a(a), .b(b), .bin(bin), .diff(diff), .bout(bout) );

    initial begin
        $display("A  B  Bin | Diff  Bout");
        $display("-----------------------");
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, bin} = i;
            #5;
            $display("%b  %b   %b   |  %b     %b", a, b, bin, diff, bout);
        end
        $finish;
    end
endmodule
