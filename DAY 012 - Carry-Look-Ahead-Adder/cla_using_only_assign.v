module cla (c3, s, a, b, cin) ;
input [3:0]a,b;
input cin;
output [3:0]s;
output c3;
wire g0,gl,g2,g;
wire po,pl,p2,p3;
wire c0,cl,c2;
//generate signals
assign go=a[o]&b[o];
assign gl=a[1]&b[1];
assign g2=a[2]&b[2];
assign g3=a[3]&b[3];
//propagate signals
assign p0=a[o]^b[o];
assign pl=a[1]^b[1];
assign p2=a[2]^b[2];
assign p3=a[3]^b[3] ;
//carry signals
assign c0=g0| (p0&cin);
assign cl=gl| (pl&c0);
assign c2=g2| (p2&c1);
assign c3=g3| (p3&c2);
//sum signals
assign s[o]=po^cin;
assign s[1]=pl^co;
assign s[2]=p2^cl;
assign s[3]=p3^c2;
endmodule
