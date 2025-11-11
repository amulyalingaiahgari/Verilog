module tb_sr_latch;
  reg s, r, en;
  wire q, qbar;
 
  sr_latch dut (s, r, en, q, qbar);
  initial begin
    
    $display("Time | en | s | r | q | qbar");
    $display("--------------------------");
    $monitor("%4t | %b  | %b | %b | %b | %b", $time, en, s, r, q, qbar);

    en=0; s=0; r=0;
    #5;
    en=1; s=0; r=0;
    #5 s=0; r=1;
    #5 s=1; r=0;
    #5 s=1; r=1;
    #5;
    en=0; s=0; r=0;
    #5 $finish;
  end
endmodule
