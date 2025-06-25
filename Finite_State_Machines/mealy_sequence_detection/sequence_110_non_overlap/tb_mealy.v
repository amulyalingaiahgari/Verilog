//to detect 110 sequence
module tb_mealy;
  reg clk;
  reg rst;
  reg data_in;
  wire data_out;

  non_mealy uut(clk,rst,data_in,data_out);
  always #2 clk = ~clk;
  initial begin
    clk=0;
    rst=1;
    #4 rst=0;
    repeat(15) @(posedge clk) begin
      #4 data_in <= {$random}%2;
    end
    #10 $finish;
  end
endmodule
