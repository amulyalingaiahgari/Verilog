module en8_tb;
    reg  [7:0] d_in;
    wire [2:0] d_out;

    en8 uut (.d_in(d_in), .d_out(d_out));

    initial begin
        $display(" Input        Output");
        $display("-----------------------------");
        for (integer i = 0; i < 8; i = i + 1) begin
          d_in = 8'b00000001 << i;
          #5;
          $display("%b  ->  %b", d_in, d_out);
        end
        $finish;
    end
endmodule
