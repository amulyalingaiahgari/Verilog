module ha_tb;
	// Inputs
	reg a;
	reg b;
	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	ha uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		a = 0; b = 0;
		#10 a = 0; b = 1;
		#10 a = 1; b = 0;
		#10 a = 1; b = 1;
		#10 $finish;
	end
      
endmodule
