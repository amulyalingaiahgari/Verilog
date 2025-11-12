module tb_buffer_register;
  reg [3:0] d;
  wire [3:0] q;

  buffer_register uut (.d(d), .q(q));

  initial begin
    $monitor("Time=%0t | d=%b | q=%b", $time, d, q);
    d = 4'b0000;
    #5 d = 4'b1010;
    #5 d = 4'b1111;
    #5 d = 4'b0101;
    #5 d = 4'b1001;
    #5 $finish;
  end
endmodule
