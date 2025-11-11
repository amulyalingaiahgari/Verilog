module tb_d_latch;
  reg d, en;
  wire q, qbar;
 
  d_latch dut (d, en, q, qbar);
  initial begin
    
    $display("Time | en | d | q | qbar");
    $display("--------------------------");
    $monitor("%4t | %b  | %b | %b | %b", $time, en, d, q, qbar);

    en=0;d=0;
    #10 d=1;
    #10 d=0;en=1;
    #10 d=1;
    #10 d=0;
    #10 $finish;
  end
endmodule
