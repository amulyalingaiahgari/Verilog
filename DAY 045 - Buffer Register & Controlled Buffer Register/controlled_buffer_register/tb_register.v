module tb_controlled_buffer_register;
  reg [3:0] d;
  reg en;
  wire [3:0] q;

  controlled_buffer_register uut (.d(d), .en(en), .q(q));

  initial begin
    $monitor("Time=%0t | en=%b | d=%b | q=%b", $time, en, d, q);

    d = 4'b0000; en = 0;
    #5 d = 4'b1010; en = 1;
    #5 d = 4'b1100; en = 0;
    #5 d = 4'b1111; en = 1;
    #5 en = 0;
    #5 $finish;
  end
endmodule
