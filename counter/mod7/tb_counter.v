module tb_mod7;
reg clk;
reg reset;
wire [2:0]count;
  
mod7 dut(clk, reset, count);
always begin
#2 clk = ~clk;

initial
begin
clk = 0;
reset = 1;
#2 reset = 0;
#10 reset = 1;
#3 reset = 0;
#20 $finish;
end
end
endmodule
