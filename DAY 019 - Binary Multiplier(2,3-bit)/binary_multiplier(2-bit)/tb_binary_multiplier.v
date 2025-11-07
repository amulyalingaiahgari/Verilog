module tb_binary_multiplier_2bit;
    reg [1:0] A, B;
    wire [3:0] P;

    binary_multiplier_2bit uut (.A(A), .B(B), .P(P));

    initial begin
        $monitor("Time=%0t | A=%b B=%b => Product=%b", $time, A, B, P);
        A=0; B=0;
        #10 A=2'b01; B=2'b01;   // 1 * 1 = 1
        #10 A=2'b10; B=2'b01;   // 2 * 1 = 2
        #10 A=2'b11; B=2'b10;   // 3 * 2 = 6
        #10 A=2'b10; B=2'b11;   // 2 * 3 = 6
        #10 A=2'b11; B=2'b11;   // 3 * 3 = 9
        #10 $finish;
    end
endmodule
