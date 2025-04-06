module fa_tb;
	// Inputs
	reg a;
	reg b;
	reg c;
	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	fa_using_ha uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.sum(sum), 
		.carry(carry)
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
