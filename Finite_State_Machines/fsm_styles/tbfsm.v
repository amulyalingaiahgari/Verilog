module tbfsm;
  reg clk;
  reg rst;
  reg g0;
  reg ws;
  wire rd;
  wire ds;

  fsm uut (clk, rst, g0, ws, rd, ds);
  always #2 clk= ~clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    g0=0;
    #4 g0=1;
    #8 ws=1;
    #4 ws=0;
    #20 $finish;
  end
endmodule
