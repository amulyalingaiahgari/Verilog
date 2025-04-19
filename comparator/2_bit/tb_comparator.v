module tbcomp;
reg [1:0]a;
reg [1:0]b;
wire eq;
wire gt;
wire lt;
comp dut (eq,gt,lt,a,b);
initial
begin
a=2'b00;b=2'b10;
#5 a=2'b10;b=2'b11;
#5 a=2'b11; b=2'b00;
#5 a=2'b01; b=2'b01;
#5 a=2'b00; b=2'b00;
#5 $finish;
end
endmodule
