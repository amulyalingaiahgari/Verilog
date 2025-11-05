module tb_excess3_adder;
    reg  [3:0] A, B;
    wire [3:0] SUM;
    wire COUT;

    excess3_adder dut (.A(A), .B(B), .SUM(SUM), .COUT(COUT));

    initial begin
      $display("Time |   A   |   B   |  COUT  | SUM");
        $display("------------------------------------");
        
        A=4'b0100; B=4'b0100; #5; // 1+1 in Excess-3
      $display("%4t | %b | %b | %b | %b",$time,A,B,COUT,SUM);
        
        A=4'b0110; B=4'b0111; #5; // 3+4 in Excess-3
      $display("%4t | %b | %b | %b | %b",$time,A,B,COUT,SUM);

        A=4'b1001; B=4'b1001; #5; // 6+6
      $display("%4t | %b | %b | %b | %b",$time,A,B,COUT,SUM);

        A=4'b1011; B=4'b0111; #5; // 8+4
      $display("%4t | %b | %b | %b | %b",$time,A,B,COUT,SUM);

        #10 $finish;
    end
endmodule
