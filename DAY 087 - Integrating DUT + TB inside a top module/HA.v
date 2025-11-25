module ha(sum,carry,a,b);
  input a;
  input b;
  output sum;
  output carry;
  
  assign sum = a^b;
  assign carry = a&b;

endmodule
