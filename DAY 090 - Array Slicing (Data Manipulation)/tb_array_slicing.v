module tb_slicing();
  reg [7:0]A;
  wire [4:0]B;
  wire [2:0]C;

  slicing dut(B, C, A);

  initial begin
    $display("===== ARRAY SLICING TEST =====");
    $monitor("Time=%0t | A=%b | B (A[7:3])=%b | C (A[2:0])=%b",
              $time, A, B, C);

    A = 8'b11010001;  // B=11010 , C=001
    #5 A = 8'b00110101; // B=00110 , C=101
    #5 A = 8'b10001100; // B=10001 , C=100
    #5 $finish;
  end
endmodule
