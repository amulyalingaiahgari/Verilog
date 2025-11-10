module tb_fs_using_decoder;
    reg A, B, Bin;
    wire Diff, Borrow;
    integer i;

    fs_using_decoder dut (.A(A), .B(B), .Bin(Bin), .Diff(Diff), .Borrow(Borrow));

    initial begin
        $display("A B Bin | Diff Borrow");
        $display("---------------------");
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Bin} = i;
            #5;
            $display("%b  %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        end
        $finish;
    end
endmodule
