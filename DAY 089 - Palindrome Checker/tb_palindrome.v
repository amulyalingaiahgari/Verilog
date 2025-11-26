module tb_palindrome;
  logic [4:0] a;
  logic y;

  palindrome_checker #(5) dut (a, y);

  initial begin
    $display("===== PALINDROME CHECKER TEST =====");

    // Option-1: Use $monitor
    $monitor("Time=%0t | a=%b | palindrome=%0d", $time, a, y);

    a = 5'b01010; #5;   // palindrome
    a = 5'b10101; #5;   // palindrome
    a = 5'b10001; #5;   // palindrome
    a = 5'b10011; #5;   // NOT palindrome

    $display("===== END TEST =====");
    $finish;
  end

endmodule
