module fs(diff,borrow,a,b,c);
    input a,b,c;
    output diff,borrow;

	wire w1,w2,w3;

	hs h1(a,b,w1,w2);
	hs h2(w1,c,diff,w3);
	or o1(borrow,w2,w3);

endmodule


module hs(diff,borrow,a,b);
	input a,b;
	output diff,borrow;
	
	assign diff = a^b;
  assign borrow = (~a)&b;
	
endmodule
