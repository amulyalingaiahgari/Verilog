module tb_jk;
  reg j;
  reg k;
  wire q;
  wire qbar;
 
  jk uut (j,k,q,qbar);
  initial begin
    j=0;k=0;
    #5 j=0;k=1;
    #5 j=1;k=0;
    #5 j=1;k=1;
    #5 j=0;k=0;
    #5 sfinish;
  end
endmodule
