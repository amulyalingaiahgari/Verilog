module fa_using_hs(sum,carry,a,b,c);
    input a,b,c;
    output sum,carry;
	
	wire w1,w2,w3,w4,w5;
	
	assign w1 = ~a;
	hs h1(w1,b,w2,w3);
	hs h2(w2,c,w4,w5);
	
	assign sum = ~w4;
	or o1(carry,w3,w5);

endmodule


module hs(diff,borrow,a,b);
	input a,b;
	output diff,borrow;
	
	assign diff = a^b;
  assign borrow = (~a) & b;
	
endmodule
