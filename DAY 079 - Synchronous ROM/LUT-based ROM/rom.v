//ROM (Combinational Implementation) — lookup table for code storage

module rom_16x8 (
  input  [3:0] addr,
  output reg [7:0] data
);

  always @(*) begin
    case(addr)
      4'h0: data = 8'hA1;
      4'h1: data = 8'hB2;
      4'h2: data = 8'hC3;
      4'h3: data = 8'hD4;
      4'h4: data = 8'hE5;
      4'h5: data = 8'hF6;
      4'h6: data = 8'h12;
      4'h7: data = 8'h34;
      4'h8: data = 8'h56;
      4'h9: data = 8'h78;
      4'hA: data = 8'h9A;
      4'hB: data = 8'hAB;
      4'hC: data = 8'hBC;
      4'hD: data = 8'hCD;
      4'hE: data = 8'hDE;
      4'hF: data = 8'hEF;
      default: data = 8'h00;
    endcase
  end

endmodule
