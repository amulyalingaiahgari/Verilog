module mux(y,sel,a,b);
  input sel,a,b;
  output y;
  assign y=sel ? b:a ;
endmodule
