module tbdpr;
  reg clk;
  reg rst;
  reg press;
  wire [3:0]count;

  dpr uut (count, clk, rst, press);
  always #2 clk = ~clk;
  initial
  begin
    clk=0;
    rst=1;
    press=0;
    #4 rst=0;
    #4 press=1;
    #4 press=0;
    #70 press=1;
    #4 press=0;
    #10 press=1;
    #4 press=0;
    #10 $finish;
  end
endmodule

//for first pulse of press, the count need to increment
//for second pulse of press, the count need to hold
