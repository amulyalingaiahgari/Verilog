module tb_mem;
  reg clk;
  reg rst;
  reg r_w;
  reg [4:0] addr;
  reg [31:0] d_in;
  wire [31:0] d_out;

  mem2 dut (.d_out(d_out), .clk(clk), .rst(rst), .r_w(r_w), .addr(addr), .d_in(d_in));

  always #2 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    r_w = 0;
    addr = 0;
    d_in = 0;

    #6 rst = 0;

    // =====================
    // Write operations
    // =====================
    r_w = 1; addr = 0;  d_in = 32'h00ADC462;
    #6    addr = 15; d_in = 32'h004DA65C;
    #6    addr = 5;  d_in = 32'h00FA537C;

    // =====================
    // Read operations
    // =====================
    #6 r_w = 0; addr = 15; $display("READ @15 = %h", d_out);
    #6 addr = 1;  $display("READ @ 1 = %h", d_out);
    #6 addr = 5;  $display("READ @ 5 = %h", d_out);

    #20 $finish;
  end
endmodule
