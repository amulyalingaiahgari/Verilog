module tb_fa_using_decoder;
    reg A, B, Cin;
    wire Sum, Carry;
    integer i;

    fa_using_decoder dut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Carry(Carry));

    initial begin
        $display("Time | A B Cin | Sum Carry");
        $display("--------------------------");
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;
            $display("%4t |  %b  %b  %b  |  %b     %b", $time, A, B, Cin, Sum, Carry);
        end
        $finish;
    end
endmodule
