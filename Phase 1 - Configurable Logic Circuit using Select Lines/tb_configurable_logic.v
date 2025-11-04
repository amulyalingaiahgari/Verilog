module tb_configurable_logic;
    logic A, B;
    logic [2:0] SEL;
    logic Y;
    integer i;

    // DUT
    configurable_logic dut (.A(A), .B(B), .SEL(SEL), .Y(Y));

    initial begin
        $display("SEL | A | B | Y ");
        $display("-----------------------------");

        A = 1; B = 0;
        for (i = 0; i < 8; i = i + 1) begin
            SEL = i[2:0];
            #5;
            $display("%b | %b | %b | %b ", SEL, A, B, Y);
        end
        #5 $finish;
    end

endmodule
