module tb_factorial;
  reg clk=0, rst=1, start=0;
  reg [7:0] in;
  wire [31:0] result;
  wire done;

  factorial dut(clk, rst, start, in, result, done);

  always #5 clk = ~clk;

  initial begin
    #10 rst = 0;
    in = 10;
    start = 1;  #10 start = 0;

    wait(done);
    $display("Factorial of %0d = %0d", in, result);

    #20 $finish;
  end
endmodule
