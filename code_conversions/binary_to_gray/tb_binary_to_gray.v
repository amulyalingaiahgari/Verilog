module b_to_g_tb;
	// Inputs
	reg [3:0] b;
	// Outputs
	wire [3:0] g;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	b_to_g uut (.b(b), .g(g));

	initial begin
		// Initialize Inputs
		for(i=0; i<16; i=i+1)
			begin
				b=i;
				#10;
			end
			$finish;
	end
      
endmodule
