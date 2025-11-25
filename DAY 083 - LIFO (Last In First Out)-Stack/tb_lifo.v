module tb_lifo;
  reg clk;
  reg rst;
  reg push;
  reg pop;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire full;
  wire empty;

  // DUT
  lifo_stack dut (.clk(clk), .rst(rst), .push(push), .pop(pop), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    push = 0;
    pop = 0;
    data_in = 0;

    #10 rst = 0;

    // PUSH operations
    push = 1; data_in = 8'hAA; #10;
    data_in = 8'hBB; #10;
    data_in = 8'hCC; #10;
    push = 0;

    // POP operations
    pop = 1; #10;
    pop = 1; #10;
    pop = 1; #10;
    pop = 0;

    #20 $finish;
  end

  // Display
  always @(posedge clk) begin
    $display("T=%0t | push=%b pop=%b | data_in=%h | data_out=%h | full=%b empty=%b", $time, push, pop, data_in, data_out, full, empty);
  end

endmodule
