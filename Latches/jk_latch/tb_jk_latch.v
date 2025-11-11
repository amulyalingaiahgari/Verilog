module tb_jk_latch;
  reg j, k, en;
  wire q, qbar;
 
  jk_latch dut (j, k, en, q, qbar);
  
  initial begin
    $display("Time | en | j | k | q | qbar");
    $display("--------------------------");
    $monitor("%4t | %b  | %b | %b | %b | %b", $time, en, j, k, q, qbar);

    en=0; j=0; k=0;
    #5;
    en=1; j=0; k=0;
    #5 j=0; k=1;
    #5 j=1; k=0;
    #5 j=1; k=1;
    #5;
    en=0; j=0; k=0;
    #5 $finish;
  end
endmodule
