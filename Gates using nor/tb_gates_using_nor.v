module gates_using_nor_tb;
	// Inputs
	reg a;
	reg b;
	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	gates_using_nor uut (
		.a(a), 
		.b(b), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#10;		
		a = 0;
		b = 1;
		#10;
		a = 1;
		b = 0;
		#10;		
		a = 1;
		b = 1;
		#10;
		$finish;
	end      
endmodule
