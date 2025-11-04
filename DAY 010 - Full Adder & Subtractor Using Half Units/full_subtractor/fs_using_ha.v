module fs(a,b,c,diff,borrow);
    input a,b,c;
    output diff,borrow;
	
	wire [4:0]w;
	
	not n1(w[0],a);
	
	ha h1(w[0],b,w[1],w[2]);
	ha h2(w[1],c,w[3],w[4]);
	
	not n2(diff,w[3]);
	or o1(borrow,w[2],w[4]);

endmodule

module ha(a,b,sum,carry);
	input a,b;
	output sum,carry;
	
	assign sum=a^b;
	assign carry=a&b;
endmodule
