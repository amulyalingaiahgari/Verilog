module comp(eq,gt,lt,a,b);
input [1:0]a;
input [1:0]b;
output eq;
output gt;
output lt;

assign eq = (a==b);
assign gt = (a>b);
assign lt = (a<b);

endmodule
