module tb_add_sub ;
reg [3:0]A, B;
reg cin;
wire [3:0]s;
wire c3;
  
add_sub uut (c3,s,A, B, cin) ;
initial
begin
cin=0;
A=4'b1100; B=4'b1001;
#5 A=4'b0011; B=4'b1101;
#5 A=4'b1110; B=4'b0001;

#5 cin=1;
A=4'b1100; B=4'b1001;
#5 A=4'b0011; B=4'b1101;
#5 A=4'b1110;B=4'b0001;
#5 sfinish;
end
endmodule
