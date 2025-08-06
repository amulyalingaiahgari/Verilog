module carry_select_adder_tb;
	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	carry_select_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		$monitor("%t, a=%b,b=%b,cin=%b",$time,a,b,cin);
		a = 4'b1010; b = 4'b0101; cin = 1'b0;
		#10;
		a = 4'b0110; b = 4'b1100; cin = 1'b1;
		#10;
		a = 4'b1011; b = 4'b0010; cin = 1'b1;
		#10;
		a = 4'b0100; b = 4'b0110; cin = 1'b0;
		#10;
		$finish;
	end
      
endmodule
