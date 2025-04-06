module fa(sum,carry,a,b,c);
    input a, b, c;
    output sum, carry;
	
	assign sum = a^b^c;
	assign carry = (a&b) | (b&c) | (a&c);

endmodule
