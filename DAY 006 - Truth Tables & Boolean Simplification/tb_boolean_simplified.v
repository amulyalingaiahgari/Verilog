module tb_boolean_simplified;

    reg A, B, C;
    wire F;

    boolean_simplified uut (.A(A), .B(B), .C(C), .F(F));

    initial begin
        $display("A B C | F");
        $display("------------");

        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i;
            #5 $display("%b %b %b | %b", A, B, C, F);
        end
        $finish;
    end
endmodule
