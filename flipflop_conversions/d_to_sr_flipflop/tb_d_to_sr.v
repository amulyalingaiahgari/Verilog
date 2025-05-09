module tbd_sr;
  reg clk;
  reg rst;
  reg s;
  reg r;
  wire q;
  wire qbar;
  
  d_sr uut (q,qbar,clk,rst,s,r);
  always #2 clk =~ clk;
  initial begin
    clk=0;
    rst=1;
    s=0;r=0;
    #4 rst=0;
    #5 s=0;r=1;
    #5 s=1;r=0;
    #5 s=1;r=1;
    //repeat(10)begin
    // #5 s={$random}%2;
    // r={$random}%2;
    //end
    #10 $finish;
  end
endmodule
