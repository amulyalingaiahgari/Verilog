module tb_mem();
  reg clk;
  reg rst;
  reg r_w;
  reg [4:0]addr;
  reg [15:0]d_in;
  wire [15:0]d_out;

  // DUT instantiation
  mem dut (.d_out(d_out), .d_in(d_in), .r_w(r_w), .addr(addr), .clk(clk), .rst(rst));

  // Clock generation
  always #2 clk = ~clk;

  initial begin
    // Initial values
    clk  = 0;
    rst  = 1;
    r_w  = 0;
    addr = 0;
    d_in = 0;

    // Release reset
    #4 rst = 0;

    // Write operations
    #6 r_w = 1; addr = 5'b00111; d_in = 16'hCC33;
    #5 addr = 5'b00010; d_in = 16'h5577;
    #3 addr = 5'b01110; d_in = 16'h1464;
    #4 addr = 5'b00110; d_in = 16'h1144;

    // Read operations
    #5 r_w = 0; addr = 5'b00111; $display ("READ DATA @ 7 = %h", d_out);
    #6 addr = 5'b01110;          $display ("READ DATA @ 14 = %h", d_out);
    #6 addr = 5'b00110;          $display ("READ DATA @ 6 = %h", d_out);

    #15 $finish;
  end

endmodule
