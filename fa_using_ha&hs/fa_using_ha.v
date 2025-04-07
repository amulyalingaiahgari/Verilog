module fa_using_ha(sum,carry,a,b,c);
    input a,b,c;
    output sum, carry;

	wire w1,w2,w3;
	
	ha h1(a,b,w1,w2);
	ha h2(w1,c,sum,w3);
	or o1(carry,w2,w3);
	
endmodule



module ha(sum,carry,a,b);
	input a,b;
	output sum,carry;
	
	assign sum = a^b;
	assign carry = a&b;
	
endmodule
