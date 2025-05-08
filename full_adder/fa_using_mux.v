module fa(a,b,c,sum,carry);
   input a,b,c;
	output sum,carry;

	wire w1;
	
	not n1(w1,c);
	mux_4x1 m1(c,w1,w1,c,b,a,sum);
  mux_4x1 m2(1'b0,c,c,1'b1,b,a,carry);

endmodule


module mux_4x1(a,b,c,d,s0,s1,y);
	input a,b,c,d;
	input s0,s1;
	output y;
	
	assign y = (!s1)&(!s0)&a |
					(!s1)&(s0)&b |
					(s1)&(!s0)&c |
					(s1)&(s0)&d;
endmodule
