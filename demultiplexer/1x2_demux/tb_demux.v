module tb_demux;
  reg sel,y;
  wire a,b;

  demux dut(a,b,sel,y);
  initial
    begin
      sel=0; y=0;
      #5 sel=0; y=1;
      #5 sel=1; y=0;
      #5 sel=1; y=1;
      
      #5 $finish;
    end
endmodule
