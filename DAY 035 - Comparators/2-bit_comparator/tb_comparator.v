module tbcomp;
    reg [1:0] a;
    reg [1:0] b;
    wire eq;
    wire gt;
    wire lt;

    // Instantiate DUT
    comp dut (.eq(eq), .gt(gt), .lt(lt), .a(a), .b(b));

    initial begin
      $display(" Time | a  b  | gt  eq  lt");
      $display("---------------------------");
      $monitor(" %0t | %b  %b  |  %b  %b  %b", $time, a, b, gt, eq, lt);

        a = 2'b00; b = 2'b10; #5;
        a = 2'b10; b = 2'b11; #5;
        a = 2'b11; b = 2'b00; #5;
        a = 2'b01; b = 2'b01; #5;
        a = 2'b00; b = 2'b00; #5;
        $finish;
    end
endmodule
