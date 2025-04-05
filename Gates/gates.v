module gates (y, a,b, control);
input a, b, control;
output y;

and g1 (y,a,b);
or g2(y,a,b);
not g3(y,a);
nand g4(y,a,b);
nor g5(y,a,b);
xor g6(y,a,b);
xnor g7(y,a,b);
buf g8(y,a);
bufifl g9(y, a, control);
bufifo g10(y,a, control);
notifl gll(y, a, control);
notifo g12(y, a, control);
endmodule
