module fs_tb;
	// Inputs
	reg a;
	reg b;
	reg c;
	// Outputs
	wire diff;
	wire borrow;

	// Instantiate the Unit Under Test (UUT)
	fs uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.diff(diff), 
		.borrow(borrow)
	);

	initial begin
		a = 0; b = 0; c = 0;
		#10 a = 0; b = 0; c = 1;
		#10 a = 0; b = 1; c = 0;
		#10 a = 0; b = 1; c = 1;
		#10 a = 1; b = 0; c = 0;
		#10 a = 1; b = 0; c = 1;
		#10 a = 1; b = 1; c = 0;
		#10 a = 1; b = 1; c = 1;
		#10 $finish;
	end
      
endmodule
