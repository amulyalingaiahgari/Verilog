module tbde8;
reg [2:0]d_in;
reg enable;
wire [7:0]d_out;
  
de8 uut (d_out, d_in, enable);
initial
begin
enable=0;
d_in=4;
#5 d_in=6;
#5 enable=1;
d in=5;
#5 d_in=3;
#5 d_in=7;
#5 sfinish;
end
  
endmodule
