module tb_d_latch;
  reg d;
  wire q,qbar;
 
  d_latch dut (q,qbar,d);
  initial begin
    d=0:
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #10 sfinish;
  end
endmodule
