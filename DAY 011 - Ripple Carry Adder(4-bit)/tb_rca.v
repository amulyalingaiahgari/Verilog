module rca_tb;
	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	// Outputs
	wire [3:0] sum;
	wire cout;
	
	integer i,j;

	// Instantiate the Unit Under Test (UUT)
	rca uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

	/*initial begin
		a = 4'b1010; b = 4'b1101; cin = 0;
		#10 a = 4'b1100; b = 4'b0011; cin = 0;
  end
		#10 $finish;*/
		
		initial
			begin
				cin = 0;
				for(i=0; i<16; i=i+1)
					begin
						a = i;
						for(j=0; j<16; j=j+1)
							begin
								b = j;
								#10;
							end
					end
			end
      
endmodule
