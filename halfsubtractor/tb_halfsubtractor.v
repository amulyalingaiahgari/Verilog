module hs_tb;
	// Inputs
	reg a;
	reg b;
	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	hs uut (
		.a(a), 
		.b(b), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		a = 0; b = 0;
		#10 a = 0; b = 1;
		#10 a = 1; b = 0;
		#10	a = 1; b = 1;
		#10 finish;		
	end
      
endmodule
