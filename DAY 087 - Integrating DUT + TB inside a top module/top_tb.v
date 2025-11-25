module top_tb;
  wire S, C;
  wire A, B;
  
  ha dut(.a(A), .b(B), .sum(S), .carry(C));
  tb_ha tb(.t_a(A), .t_b(B), .t_sum(S), .t_carry(C));
endmodule
