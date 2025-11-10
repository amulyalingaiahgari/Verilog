module tb_comparator_1bit;
    reg A, B;
    wire A_greater, A_equal, A_less;

    comparator_1bit uut (.A(A),.B(B),.A_greater(A_greater),.A_equal(A_equal),.A_less(A_less));

    initial begin
      $display("Time | A B | A>B A==B A<B");
      $monitor("%0t | %b  %b |  %b    %b    %b", $time, A, B, A_greater, A_equal, A_less);

        A=0; B=0; #10;
        A=0; B=1; #10;
        A=1; B=0; #10;
        A=1; B=1; #10;

        $finish;
    end
endmodule
