module tb_one_bit_comparator;
    reg a, b;
    wire lt, gt, eq;

    one_bit_comparator_using_mux4x1 dut(a, b, lt, gt, eq);

    initial begin
      $display("A B | GT EQ LT ");
      $monitor("%b %b |  %b  %b  %b", a, b, gt, eq, lt);

        a=0; b=0; #5;
        a=0; b=1; #5;
        a=1; b=0; #5;
        a=1; b=1; #5;
        $finish;
    end
endmodule
