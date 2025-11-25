module tb_ha(
  output reg t_a,
  output reg t_b,
  input      t_sum,
  input      t_carry
);
  
  initial begin
    $monitor("time=%0t | a=%b b=%b | sum=%b carry=%b", $time, t_a, t_b, t_sum, t_carry);
              
    t_a=0; t_b=0;
    #5 t_a=0; t_b=1;
    #5 t_a=1; t_b=0;
    #5 t_a=1; t_b=1;
    #5 $finish;
    
  end
endmodule
