module mux_2x1(
  input sel0,
  input i0, i1,
  output y);
  
  assign y = sel0 ? i1 : i0;
endmodule



module mux_4x1(
  input sel0, sell,
  input  i0,i1,i2,i3,
  output reg y);
  
  wire y0, y1;
  
  mux_2_1 m1(sell, i2, i3, y1);
  mux_2_1 m2(sell, i0, i1, y0);
  mux_2_1 m3(sel0, y0, y1, y);
endmodule
