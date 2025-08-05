module four_bit_comp_tb;
	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	// Outputs
	wire lt;
	wire eq;
	wire gt;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	four_bit_using_one_bit_comp uut (
		.a(a), 
		.b(b), 
		.lt(lt), 
		.eq(eq), 
		.gt(gt)
	);

	initial begin
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
