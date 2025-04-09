module tb;
  reg [1:0] sel;
  reg i0,i1,i2,i3;
  wire y;
  
  mux_example mux(sel, i0, i1, i2, i3, y);
  
  initial begin
    $monitor("sel = %b,i3 = %0b, i2 = %0b ,i1 = %0b, i0 = %0b,y = %0b", sel,i3,i2,i1,i0,y);
     repeat(6) begin
      sel = {$random}%4;
      #5;
    end
    #5 $finish;
  end
endmodule
