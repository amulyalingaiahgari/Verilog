module tb_mod8;
reg clk;
reg reset;
wire [2:0]count;
  
mod8 dut(clk, reset, count);
always begin
#2 clk = ~clk;
end

initial
begin
clk = 0;
reset = 1;
#3 reset = 0;
#10 reset = 1;
#2 reset = 0;
#20 $finish;
  
$monitor($time,"clk = %b, reset=%b, count=%b", clk, reset, count);
end
endmodule
