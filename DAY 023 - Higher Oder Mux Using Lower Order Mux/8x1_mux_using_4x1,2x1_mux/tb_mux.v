module tb8x1;
  reg [7:0]i;
  reg [2:0]s;
  wire y;
  
  mux8 dut (y,s,i);
  
  initial begin
    i=8'hd5; s=0;
    #5 s=1;
    #5 s=2;
    #5 s=3;
    #5 s=4;
    #5 s=5;
    #5 s=6;
    #5 s=7;
    #5 $finish;
  end
endmodule
