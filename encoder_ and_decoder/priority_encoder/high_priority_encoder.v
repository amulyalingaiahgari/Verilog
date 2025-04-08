module en (y, v,i,en) ;
input [3:0]i;
input en;
output reg [1:0]y;
output reg v;
  
  always @(*) begin
if(en) begin
y=2'bx;
v=0;
end
else begin
if(i[3])begin
y=3;v=1;
eno
else if(i[2])begin
y=2;v=1;
end
else if(i[1])begin
y=1;v=1;
end
else if(i[ø])begin
y=0;v=1;
end
end
end
    
endmodule
