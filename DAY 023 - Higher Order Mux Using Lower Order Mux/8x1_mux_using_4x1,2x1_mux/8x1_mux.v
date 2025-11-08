module mux2 (y, s0,i0,il);
input i0,il;
input s0;
output y;
assign y=s0 ? il : i0;
endmodule

module mux4 (y,s0,s1,i0,i1,i2,i3);
input i0,i1,i2,i3;
input s0,s1;
output y;
assign y=s1?(s0?i3:i2):(s0?il:i0);
endmodule

module mux8 (y, s, i);
input [7:0]i;
input [2:0]s;
output y;
wire w1,w2;
mux4 m1 (w1,s[0],s[1],i[0],i[1],i[2],i[3]);
mux4 m2 (w2,s[0],s[1],i[4],i[5],i[6],i[7]);
mux2 m3 (y,s[2],w1,w2);
endmodule
