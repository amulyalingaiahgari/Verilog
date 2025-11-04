module tb_binary_add_sub();
    reg  [3:0] A, B;
    reg        mode;
    wire [3:0] Result;
    wire       Carry, Overflow;

  binary_add_sub uut (.A(A), .B(B), .mode(mode), .Result(Result), .Carry(Carry), .Overflow(Overflow));

    initial begin
      $monitor("Time=%0t | A=%b | B=%b | Mode=%b | Result=%b | Carry=%b | Overflow=%b", $time, A, B, mode, Result, Carry, Overflow);

        // Test Addition
        A = 4'b0101; B = 4'b0011; mode = 0; #10;  
        // Test Subtraction
        mode = 1; #10;  
        // Another Addition
        A = 4'b1001; B = 4'b0111; mode = 0; #10;  
        // Another Subtraction
        mode = 1; #10;   (2's complement)
        #10 $finish;
    end
endmodule
