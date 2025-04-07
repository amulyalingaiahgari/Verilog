module mux(y,sel,a,b);
  input sel,a,b;
  output y;

  always @ (se or a or b)
    begin
      case(sel)
        1'b0: y=a;
        1'b1: y=a;
      endcase
    end
endmodule
