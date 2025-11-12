module tbsipo;
  reg clk;
  reg rst;
  reg data_in;
  wire [3:0]data_out;
  
  sipo uut (data_out, clk, rst, data_in);
  
  always #2 clk = ~clk;  
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    data_in=1;
    #5 data_in=0;
    #5 data_in=1;
    #5 data_in=0;
    #5 $finish;
  end
endmodule
