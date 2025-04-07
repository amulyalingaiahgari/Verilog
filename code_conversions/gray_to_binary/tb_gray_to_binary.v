module g_to_b_tb;
	// Inputs
	reg [3:0] g;
	// Outputs
	wire [3:0] b;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	g_to_b uut (.g(g), .b(b));

	initial begin
		for(i=0; i<16; i=i+1)
			begin
				g=i;
				#10;
			end
			$finish;
	end
      
endmodule
