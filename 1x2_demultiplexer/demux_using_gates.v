module demux(a,b,sel,y);
  input sel,y;
  output a,b;

  wire not_sel;
  
  not g1(not_sel,sel);
  and g2(a,y,not_sel);
  and g3(b,y,sel);

endmodule
