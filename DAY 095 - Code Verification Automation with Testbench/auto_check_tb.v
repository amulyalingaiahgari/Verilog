module tb_excess3;

  reg  [3:0] bcd;
  wire [3:0] xs3;

  integer errors = 0;
  integer i;

  excess3 dut (.bcd(bcd), .xs3(xs3));

  // Automatic Expected Value Function
  function [3:0] expected_xs3(input [3:0] val);
      expected_xs3 = val + 4'd3;
  endfunction

  initial begin
    $display("=== Excess-3 Verification Started ===");

    // Loop through all valid inputs
    for(i = 0; i < 10; i = i + 1) begin
        bcd = i[3:0];
        #1; // settle time
        
        if(xs3 !== expected_xs3(bcd)) begin
            $display("FAIL: Input=%0d Expected=%b Got=%b",
                     bcd, expected_xs3(bcd), xs3);
            errors = errors + 1;
        end else begin
            $display("PASS: Input=%0d Output=%b", bcd, xs3);
        end
    end

    if(errors == 0)
        $display("=== ALL TESTS PASSED ===");
    else
        $display("=== TEST FAILED: %0d ERRORS ===", errors);

    $finish;
  end

endmodule
