module mux(y,sel,a,b);
  input sel,a,b;
  output reg y;
  
  always @(a or b or sel)
    begin
      if(sel)
        y=b;
      else
        y=a;
    end
endmodule
