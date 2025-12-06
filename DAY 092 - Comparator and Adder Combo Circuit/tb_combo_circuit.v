module tb_comp_adder;
    parameter WIDTH = 8;

    reg  [WIDTH-1:0] A, B;
    wire gt, lt, eq;
    wire [WIDTH:0] sum;

    integer i;
    integer errors = 0;

    comp_adder #(WIDTH) dut (
        .A(A), .B(B),
        .gt(gt), .lt(lt), .eq(eq),
        .sum(sum)
    );

    // Expected result functions
    function exp_gt(input [WIDTH-1:0] a, b);
        exp_gt = (a > b);
    endfunction

    function exp_lt(input [WIDTH-1:0] a, b);
        exp_lt = (a < b);
    endfunction

    function exp_eq(input [WIDTH-1:0] a, b);
        exp_eq = (a == b);
    endfunction

    function [WIDTH:0] exp_sum(input [WIDTH-1:0] a, b);
        exp_sum = a + b;
    endfunction

    initial begin
      $display("==== Comparator + Adder Verification Started ===");

        for (i = 0; i < 50; i = i + 1) begin
            A = $urandom;
            B = $urandom;
            #1;

            if (gt !== exp_gt(A,B) || lt !== exp_lt(A,B) || eq !== exp_eq(A,B) || sum !== exp_sum(A,B)) begin

                $display("FAIL | A=%0d B=%0d | GT=%b LT=%b EQ=%b SUM=%0d",
                          A, B, gt, lt, eq, sum);
                errors = errors + 1;

            end else begin
                $display("PASS | A=%0d B=%0d | GT=%b LT=%b EQ=%b SUM=%0d", A, B, gt, lt, eq, sum);
            end
        end

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("FAILED with %0d errors", errors);

        $finish;
    end

endmodule
