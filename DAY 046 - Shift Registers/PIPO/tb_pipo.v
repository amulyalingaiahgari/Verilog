module tbpipo ;
  reg clk;
  reg rst;
  reg [3:0]data_in;
  wire [3:0]data_out;

  pipo uut(data_out, clk, rst, data_in);

  always #2 clk = ~clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    data_in=5;
    #5 data_in=8;
    #5 data_in=3;
    #5 $finish;
  end
endmodule
