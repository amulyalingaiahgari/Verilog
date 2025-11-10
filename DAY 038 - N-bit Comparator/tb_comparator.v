module tb_n_bit_comparator;
    parameter N = 4;

    reg  [N-1:0] A, B;
    wire A_gt_B, A_lt_B, A_eq_B;

    n_bit_comparator #(N) dut (.A(A), .B(B), .A_gt_B(A_gt_B), .A_lt_B(A_lt_B), .A_eq_B(A_eq_B));

    initial begin
      $display("Time | A | B | GT  EQ  LT");
      $monitor("%0t | %b | %b | %b  %b  %b", $time, A, B, A_gt_B, A_eq_B, A_lt_B);

        A = 4'b0101; B = 4'b0101; #5;   // Equal
        A = 4'b0110; B = 4'b0011; #5;   // Greater
        A = 4'b0010; B = 4'b0111; #5;   // Less
        A = 4'b1111; B = 4'b0000; #5;   // Greater
        A = 4'b0000; B = 4'b1111; #5;   // Less

        $finish;
    end
endmodule
