//======================================================
// Day 7 - Testbench for K-map simplifications
//======================================================
module tb_kmap;

    reg A, B, C, D;
    wire F2, F3, F4;

    kmap2 dut2 (.A(A), .B(B), .F(F2));
    kmap3 dut3 (.A(A), .B(B), .C(C), .F(F3));
    kmap4 dut4 (.A(A), .B(B), .C(C), .D(D), .F(F4));

    initial begin
        $display("==== 2-variable Function ====");
        for (integer i = 0; i < 4; i++) begin
            {A,B} = i;
            #1 $display("A=%b B=%b -> F=%b", A, B, F2);
        end

        $display("\n==== 3-variable Function ====");
        for (integer i = 0; i < 8; i++) begin
            {A,B,C} = i;
            #1 $display("A=%b B=%b C=%b -> F=%b", A, B, C, F3);
        end

        $display("\n==== 4-variable Function ====");
        for (integer i = 0; i < 16; i++) begin
            {A,B,C,D} = i;
            #1 $display("A=%b B=%b C=%b D=%b -> F=%b", A, B, C, D, F4);
        end
        $finish;
    end
endmodule
