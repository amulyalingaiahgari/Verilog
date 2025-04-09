module tb;
  reg sel0, sel1;
  reg i0,i1,i2,i3;
  wire y;
  
  mux_4x1 mux(sel0, sel1, i0, i1, i2, i3, y);
  
  initial begin
    $monitor("sel0=%b, sel1=%b, i3 = %0b, i2 = %0b ,i1 = %0b, i0 = %0b, y = %0b", sel0,sel1,i3,i2,i1,i0, y);

    repeat(6) begin
      {sel0, sell} = {$random}%4;
      #5;
    end
    #5 $finish;
  end
endmodule
