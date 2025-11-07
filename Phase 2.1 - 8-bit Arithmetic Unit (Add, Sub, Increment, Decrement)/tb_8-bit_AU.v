module tb_arithmetic_unit_8bit;

    reg  [7:0] A, B;
    reg  [1:0] SEL;
    wire [7:0] RESULT;
    wire COUT;

    arithmetic_unit_8bit dut (.A(A), .B(B), .SEL(SEL), .RESULT(RESULT), .COUT(COUT));

    initial begin
        $display("Time | SEL |     A     |     B     |   RESULT   | COUT | Operation");
        $display("-----------------------------------------------------------------");

        A = 8'd10; B = 8'd5;

        SEL = 2'b00; #5; // Addition
        $display("%4t | %b  | %8b | %8b | %8b |  %b  | ADD", $time, SEL, A, B, RESULT, COUT);

        SEL = 2'b01; #5; // Subtraction
        $display("%4t | %b  | %8b | %8b | %8b |  %b  | SUB", $time, SEL, A, B, RESULT, COUT);

        SEL = 2'b10; #5; // Increment
        $display("%4t | %b  | %8b | %8b | %8b |  %b  | INC", $time, SEL, A, B, RESULT, COUT);

        SEL = 2'b11; #5; // Decrement
        $display("%4t | %b  | %8b | %8b | %8b |  %b  | DEC", $time, SEL, A, B, RESULT, COUT);

        #10 $finish;
    end
endmodule
