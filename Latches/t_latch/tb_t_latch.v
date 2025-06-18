module tb_t_latch;
  reg t;
  wire q;
  wire qbar;

  t_latch uut (t,q,qbar);
  initial begin
    t=0;
    #5 t=1;
    #5 t=0;
    #5 t=1;
    #5 sfinish;
  end
endmodule
