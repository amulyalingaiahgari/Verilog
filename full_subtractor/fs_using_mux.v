module fs(a,b,c,diff,borrow);
   input a,b,c;
   output diff,borrow;

	wire w1;
	
  not n1(w1,c);
	
  mux_4x1 m1(c,w1,w1,c,b,a,diff);
  mux_4x1 m2(c,1'b1,1'b0,c,b,a,borrow);
	
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
