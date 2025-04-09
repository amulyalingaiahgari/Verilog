module tb_mux;
  reg sel,a,b;
  wire y;
  mux dut(y,sel,a,b);
  initial 
    begin
      sel=0;
      a=0; b=0;
      #5 a=0; b=1;
      #5 a=1; b=0;
      #5 a=1; b=1;

      #5 sel=1;
      a=0; b=0;
      #5 a=0; b=1;
      #5 a=1; b=0;
      #5 a=1; b=1;

      #5 $finish;
    end
endmodule
