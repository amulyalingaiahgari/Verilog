//Module — Multi-Code Converter & Comparator
module multi_code_system(
  input [3:0] A, B,
  input [1:0] mode,
  output reg gt, lt, eq,
  output reg [3:0] convA, convB
);
  always @(*) begin
    // Default
    gt=0; lt=0; eq=0;
    case(mode)
      2'b00: begin
        convA=A; convB=B; // Binary
      end
      2'b01: begin
        convA = A ^ (A >> 1); // Gray
        convB = B ^ (B >> 1);
      end
      2'b10: begin
        convA = A + 3; // Excess-3
        convB = B + 3;
      end
      2'b11: begin
        convA = (A>9)?9:A; // BCD
        convB = (B>9)?9:B;
      end
    endcase

    if(convA > convB) gt = 1;
    else if(convA < convB) lt = 1;
    else eq = 1;
  end
endmodule
