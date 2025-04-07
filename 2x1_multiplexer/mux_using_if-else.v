module mux(y,sel,a,b);
  input sel,a,b;
  output y;
  
  always @(a or b)
    begin
      if(sel)
        y=b;
      else
        y=a;
    end
endmodule
