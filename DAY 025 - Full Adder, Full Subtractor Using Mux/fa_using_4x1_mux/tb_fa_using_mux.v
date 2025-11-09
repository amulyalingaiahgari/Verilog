module tb_full_adder_using_mux;
    // Inputs
    reg A, B, Cin;
    // Outputs
    wire Sum, Cout;

    // Instantiate the DUT (Device Under Test)
    full_adder_using_mux dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Test procedure
    initial begin
        $display("==========================================");
        $display(" FULL ADDER USING 4x1 MUX TESTBENCH ");
        $display("==========================================");
        $display(" A  B  Cin | Sum  Cout ");
        $display("------------------------");

        // Apply all 8 possible input combinations
        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;   // Assign inputs from loop variable
            #10;               // Wait for 10ns
            $display(" %b  %b   %b  |  %b     %b", A, B, Cin, Sum, Cout);
        end

        $display("------------------------");
        $display("Simulation Completed Successfully");
        #10 $finish;
    end

endmodule
