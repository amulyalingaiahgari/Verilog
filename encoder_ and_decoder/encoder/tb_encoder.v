module tben8;
reg [7:0]d_in;
reg enable;
wire [2:0]d_out;
  
en uut (d_out,d_in,enable);
initial
begin
enable=0;
#5 d_in=2;
#5 d_in=6;
#5 enable=1;
#5 d_in=5;
#5 d_in=6;
#5 d_in=7;
end
  
endmodule
