module tb_multiplier_4x3;
    reg  [3:0] A;
    reg  [2:0] B;
    wire [6:0] P;

    multiplier_4x3 uut (.A(A), .B(B), .P(P));

    initial begin
        $monitor("Time=%0t | A=%b (%0d) B=%b (%0d) => Product=%b (%0d)", 
                  $time, A, A, B, B, P, P);
        
        A=4'b0000; B=3'b000; #10;
        A=4'b0011; B=3'b010; #10;   // 3×2 = 6
        A=4'b0101; B=3'b101; #10;   // 5×5 = 25
        A=4'b1111; B=3'b111; #10;   // 15×7 = 105
        A=4'b1001; B=3'b011; #10;   // 9×3 = 27
        $finish;
    end
endmodule
