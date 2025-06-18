module tbsr;
  reg s,r;
  wire q,qbar;
 
  sr uut (q,qbar,s,r);
  initial
  begin
    s=0;r=0;
    #5 s=0;r=1;
    #5 s=1;r=0;
    #5 s=1; r=1;
    #5 s=0;r=0;
    #5 sfinish;
  end
 
  always @(s or r) begin
    $display("q=%b,qbar=%b",q,qbar);
  end
endmodule
