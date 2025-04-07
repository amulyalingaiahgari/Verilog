//4-bit ripple_carry_adder
module rca (sum,cout,a,b,cout);
    input [3:0] a,b;
    output [3:0] s;
    input cin;
    output cout;

	wire c0,c1,c2;
	
	fa f1(a[0],b[0],cin,s[0],c0);
	fa f2(a[1],b[1],c0,s[1],c1);
	fa f3(a[2],b[2],c1,s[2],c2);
	fa f4(a[3],b[3],c2,s[3],cout);

endmodule



module fa(sum,carry,a,b,c);
	input a,b,c;
	output sum,carry;
	
	assign sum = a^b^c;
	assign carry = (a&b) | (b&c) | (a&c);
	
endmodule
