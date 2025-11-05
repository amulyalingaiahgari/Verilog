module tb_carry_save_adder#(parameter N = 8);

  reg  [N-1:0] A, B, C;
  wire [N-1:0] Sum, Carry;
  wire [N:0] Final_Sum;

    // DUT
  carry_save_final_sum dut (.A(A), .B(B), .C(C), .Final_Sum(Final_Sum));

    // Stimulus
    initial begin
      $monitor("Time=%0t | A=%b | B=%b | C=%b | Carry=%b | Sum=%b | Final_Sum=%b", $time, A, B, C, dut.Carry, dut.Sum, Final_Sum);

        A = 8'b00001101; // 13
        B = 8'b00000111; // 7
        C = 8'b00000011; // 3
        #10;

        A = 8'b00001001; // 9
        B = 8'b00000110; // 6
        C = 8'b00000101; // 5
        #10;

        A = 8'b11110000; // 240
        B = 8'b00001111; // 15
        C = 8'b00000001; // 1
        #10;

        $finish;
    end

endmodule
