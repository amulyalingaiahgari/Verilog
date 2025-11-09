module tb_gates_using_mux;
    reg a, b;
    wire and_out, or_out, xor_out, not_out;
    wire nand_out, nor_out, xnor_out;

    gates_using_mux DUT (.a(a), .b(b), .and_out(and_out), .or_out(or_out), .xor_out(xor_out), .not_out(not_out), .nand_out(nand_out), .nor_out(nor_out), .xnor_out(xnor_out));

    initial begin
        $monitor("T=%0t | A=%b B=%b | AND=%b OR=%b XOR=%b XNOR=%b NAND=%b NOR=%b NOT(A)=%b",
                 $time, a, b, and_out, or_out, xor_out, xnor_out, nand_out, nor_out, not_out);

        // Test all combinations
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;
    end
endmodule
