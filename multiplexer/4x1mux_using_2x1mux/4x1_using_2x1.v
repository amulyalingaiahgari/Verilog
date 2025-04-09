module mux_2x1(
  input se0,
  input i0, i1,
  output y);
  
  assign y = se0 ? i1 : i0;
endmodule



module mux_4x1(
  input se0, sel,
  input  i0,i1,i2,i3,
  output reg y);
  
  wire y0, y1;
  
  mux_2_1 m1(sel, i2, i3, y1);
  mux_2_1 m2(sel, i0, i1, y0);
  mux_2_1 m3(se0, y0, y1, y);
endmodule
