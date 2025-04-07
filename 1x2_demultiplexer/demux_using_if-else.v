module demux(a,b,sel,y);
  input sel,y;
  output reg a,b;

  always @(y or sel)
    begin
      if(sel)
        b=y;
      else
        a=y;
    end
endmodule
