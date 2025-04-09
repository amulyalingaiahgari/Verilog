module demux(a,b,sel,y);
  input sel,y;
  output reg a,b;

  always @(y or sel) 
    begin
      case(sel)
        1'b0: a=y;
        1'b1: b=y;
      endcase
    end
endmodule
