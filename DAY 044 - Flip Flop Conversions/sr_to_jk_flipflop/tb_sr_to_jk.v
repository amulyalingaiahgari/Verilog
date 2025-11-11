module tbsr_jk;
  reg clk;
  reg rst;
  reg j,k;
  wire q;

  sr jk uut (q,clk, rst, j,k);
  always #2 clk =~ clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    j=0;k=0;
    #5 j=0;k=1;
    #5 j=1;k=0;
    #5 j=1;k=1;
    #5 $finish;
  end
endmodule
