module tb_t_latch;
  reg t, en;
  wire q, qbar;
 
  t_latch dut (t, en, q, qbar);
  
  initial begin
    $display("Time | en | t | q | qbar");
    $display("--------------------------");
    $monitor("%4t | %b  | %b | %b | %b | %b", $time, en, t, q, qbar);

        en = 0; t = 0; #10;
        en = 1; t = 0; #10;
        en = 1; t = 1; #10;
        en = 1; t = 0; #10;
        en = 1; t = 1; #10;
        en = 0; t = 1; #10;
        en = 1; t = 1; #10;

        $finish;
    end
endmodule
