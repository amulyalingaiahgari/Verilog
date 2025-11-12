module tbpiso;
  reg clk;
  reg rst;
  reg [3:0]data_in;
  reg load;
  wire data_out;

  piso uut(data_out, clk, rst, data_in, load) ;

  always #2 clk = ~clk;
  initial begin
    clk=0;
    rst=1;
    data_in=8;
    #4 rst=0;
    #4 load=1;
    #10 load=0;
    #30 $finish;
  end
endmodule
