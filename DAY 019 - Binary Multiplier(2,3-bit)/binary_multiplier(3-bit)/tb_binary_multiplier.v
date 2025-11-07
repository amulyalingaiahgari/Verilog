module tb_binary_multiplier_3bit;
    reg [2:0] A, B;
    wire [5:0] P;

    binary_multiplier_3bit uut (.A(A), .B(B), .P(P));

    initial begin
        $monitor("Time=%0t | A=%b B=%b => Product=%b", $time, A, B, P);
        A=3'b000; B=3'b000;
        #10 A=3'b001; B=3'b010;  // 1*2 = 2
        #10 A=3'b011; B=3'b010;  // 3*2 = 6
        #10 A=3'b101; B=3'b011;  // 5*3 = 15
        #10 A=3'b111; B=3'b111;  // 7*7 = 49
        #10 $finish;
    end
endmodule
