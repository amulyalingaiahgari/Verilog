module mux(y,sel,a,b);
  input sel,a,b;
  output y;

  wire not_sel,w1,w2;

  not g1(not_sel,sel);
  and g2(w1,a,not_sel);
  and g3(w2,b,sel);
  or g4(y,w1,w2);
  
endmodule
