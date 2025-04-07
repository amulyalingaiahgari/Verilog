module cla_adder(s,c3,a,b,c);
    input [3:0] a,b;
    input cin;
    output [3:0] s;
    output c4;
	
    wire p0,p1,p2,p3;//propagate = a^b
    wire g0,g1,g2,g3;//generate = a&b
    wire c1,c2,c3;//internal carry
	
	xor x1(p0,a[0],b[0]);
	xor x2(p1,a[1],b[1]);
	xor x3(p2,a[2],b[2]);
	xor x4(p3,a[3],b[3]);
	
	and a1(g0,a[0],b[0]);
	and a2(g1,a[1],b[1]);
	and a3(g2,a[2],b[2]);
	and a4(g3,a[3],b[3]);
	
	assign c1 = g0 | (p0 & cin);
	assign c2 = g1 | (p1 & c1);
	assign c3 = g2 | (p2 & c2);
	assign c4 = g3 | (p3 & c3);
	
	assign s[0] = p0 ^ cin;
	assign s[1] = p1 ^ c1;
	assign s[2] = p2 ^ c2;
	assign s[3] = p3 ^ c3;

endmodule
