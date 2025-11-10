module tb_comparator;
    reg [3:0] A, B;
    wire A_grt_B, A_less_B, A_eq_B;

    // Instantiate DUT
    comparator dut (.A(A), .B(B), .A_grt_B(A_grt_B), .A_less_B(A_less_B), .A_eq_B(A_eq_B));

    initial begin
      $display(" Time | A  | B  | A>B | A=B | A<B");
      $display("-----------------------------------");
      $monitor("  %0t | %b | %b | %b | %b | %b", $time, A, B, A_grt_B, A_eq_B, A_less_B);

        A = 4'b0001; B = 4'b0010; #5;
        A = 4'b1010; B = 4'b0111; #5;
        A = 4'b1001; B = 4'b1001; #5;
        A = 4'b1111; B = 4'b0000; #5;
        A = 4'b0101; B = 4'b0110; #5;
        $finish;
    end
endmodule
