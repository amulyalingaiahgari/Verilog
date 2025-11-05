module tb_carry_skip_adder_8bit;
    logic [7:0] A, B;
    logic Cin;
    logic [7:0] Sum;
    logic Cout;

    // DUT
    carry_skip_adder_8bit dut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        $display("Time |   A    |   B    | Cin |  Sum   | Cout");
        $display("---------------------------------------------");

        // Test cases
        A=8'h0A; B=8'h05; Cin=0; #10;
        $display("%4t | %b | %b |  %b  | %b |  %b", $time, A, B, Cin, Sum, Cout);

        A=8'hFF; B=8'h01; Cin=0; #10;
        $display("%4t | %b | %b |  %b  | %b |  %b", $time, A, B, Cin, Sum, Cout);

        A=8'h55; B=8'hAA; Cin=1; #10;
        $display("%4t | %b | %b |  %b  | %b |  %b", $time, A, B, Cin, Sum, Cout);

        A=8'h7F; B=8'h01; Cin=1; #10;
        $display("%4t | %b | %b |  %b  | %b |  %b", $time, A, B, Cin, Sum, Cout);

        #10 $finish;
    end
endmodule
