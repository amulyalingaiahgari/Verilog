module four_bit_comp_tb;
	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	// Outputs
	wire lt, gt, eq;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	four_bit_using_one_bit_comp uut (.a(a), .b(b), .lt(lt), .eq(eq), .gt(gt));

	initial begin
	  $display(" Time | A  | B  | A>B | A=B | A<B");
      $display("-----------------------------------");
      $monitor("  %0t | %b | %b | %b | %b | %b", $time, a, b, gt, eq, lt);
      for(i=0; i<16; i=i+1) begin
        a=i;
      	for(j=0; j<16; j=j+1) begin
          b=j;
       	  #10;
        end
	  end
      $finish;
	end
endmodule
