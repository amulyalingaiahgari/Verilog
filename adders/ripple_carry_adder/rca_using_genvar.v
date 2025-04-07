module rca (cout, s, a,b, cin) ;
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire [3:0]c;
  
genvar 1;
generate
for(i=0;i<4;i=i+1) begin :FA
if(i == 0) begin
FA fa0 (.a(a[i]), .b(b[i]), .c(cin), .sum(s[i]), .carry(c[i]) );
end
else begin
FA fa_i (.a(a[i]), .b(b[i]), .c(c[i-1]), .sum(s[i]), .carry(c[i]));
end
end
endgenerate
  
assign cout=c[3];
endmodule
