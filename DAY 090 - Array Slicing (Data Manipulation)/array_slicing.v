module slicing(B,C,A); 
  input [7:0]A; 
  output [4:0]B; 
  output [2:0]C; 
  
  assign B=A[7:3]; 
  assign C=A[2:0]; 

endmodule
