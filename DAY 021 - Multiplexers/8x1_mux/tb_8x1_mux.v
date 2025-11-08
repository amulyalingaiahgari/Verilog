module tb_mux8x1;
    reg [7:0] in;       // 8 input lines
    reg [2:0] sel;      // 3-bit select
    wire out;           // Output

    // Instantiate DUT (Design Under Test)
    mux8x1 uut (.in(in), .sel(sel), .out(out));

    initial begin
        $display("Time\t sel\t in\t\t out");
        $display("---------------------------------------");

        // Initialize
        in = 8'b10111010;  // Example data pattern

        // Apply all select line combinations
        sel = 3'b000; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b001; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b010; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b011; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b100; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b101; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b110; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);
        sel = 3'b111; #10; $display("%0t\t %b\t %b\t %b", $time, sel, in, out);

        $finish;
    end

endmodule
