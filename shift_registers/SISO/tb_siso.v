module tbsiso;
reg clk;
reg rst;
reg data_in;
wire data_out;
  
siso dut (data_out,clk, rst,data_in);
always #2 clk =~ clk;
  
initial
begin
clk=0;
rst=1;
#4 rst=0;
data in=1;
#4 data in=0;
#4 data_in=0;
#4 data in=1;
#4 data in=1A
#10 $finish;
end
endmodule
