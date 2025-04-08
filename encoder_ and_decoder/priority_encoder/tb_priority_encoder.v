module tben ;
reg [3:0]i;
reg en;
wire [1:0]y;
wire v;
  
en uut (y, v,i,en);
initial begin
en=1;
1=7;
#4 en=0;
repeat (20) begin
  #4 i={srandom}%16;
end
#10 sfinish;
end
  
endmodule
//active low enable
