module tb_full_subtractor_using_mux;
    reg A, B, Bin;
    wire Diff, Bout;

    // Instantiate DUT
    full_subtractor_using_mux dut (
        .A(A), .B(B), .Bin(Bin),
        .Diff(Diff), .Bout(Bout)
    );

    initial begin
        $display("==============================================");
        $display(" FULL SUBTRACTOR USING 4x1 MUX TESTBENCH ");
        $display("==============================================");
        $display(" A  B  Bin | Diff  Bout ");
        $display("--------------------------");

        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, Bin} = i;
            #10;
            $display(" %b  %b   %b  |   %b     %b", A, B, Bin, Diff, Bout);
        end

        $display("--------------------------");
        $display("Simulation Completed Successfully");
        #10 $finish;
    end

endmodule
