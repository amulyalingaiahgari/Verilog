module gates_using_demux_tb;
    reg a, b;
    wire not_y, and_y, or_y, nand_y, nor_y, xor_y, xnor_y;

    gates_using_demux dut(.a(a), .b(b), .not_y(not_y), .and_y(and_y), .or_y(or_y), .nand_y(nand_y), .nor_y(nor_y), .xor_y(xor_y), .xnor_y(xnor_y) );

    initial begin
      $display("A  B | NOT  AND  OR  NAND  NOR  XOR  XNOR");
        $display("------------------------------------");
        for (integer i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #5;
          $display("%b  %b |  %b   %b   %b    %b    %b    %b    %b", a, b, not_y, and_y, or_y, nand_y, nor_y, xor_y, xnor_y);
        end
        $finish;
    end
endmodule
