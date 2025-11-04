module add_sub (c3, s, A, B, cin) ;
input [3:0]A,B;
input cin;
output [3:0]s;
output c3;
  
wire co,cl,c2;
wire b0,b1,b2,b3;
  
assign b0=cin^B[o];
assign bl=cin^B[1];
assign b2=cin^B[2];
assign b3=cin^B[3];
FA fal (.a(A[o]), .b(be), .c(cin), .sum(s[o]), .carry(c0));
FA fa2 (.a(A[1]), .b(b1), .c(co), .sum(s[1]), .carry(c1));
FA fa3 (.a(A[2]), .b(b2), .c(cl), .sum(s[2]), .carry(c2));
FA fa4 (.a(A[3]), .b(b3), .c(c2), .sum(s[3]), .carry(c3));
endmodule

module FA (sum, carry, a, b, c) ;
input a,b,c;
output carry,sum;
assign sum=a^b^c;
  assign carry=(a&b) | (c&(a^b));
endmodule
