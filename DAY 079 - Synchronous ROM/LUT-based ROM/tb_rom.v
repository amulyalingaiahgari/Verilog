module tb_rom;
  reg [3:0] addr;
  wire [7:0] data;

  rom_16x8 dut (.addr(addr), .data(data));

  integer i;

  initial begin
    $display("===== ROM TEST START =====");

    for (i = 0; i < 16; i = i + 1) begin
      addr = i;
      #2;
      $display("ADDR=%0h DATA=%0h", addr, data);
    end

    $display("===== ROM TEST END =====");
    $finish;
  end

endmodule
