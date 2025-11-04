module cla_tb;
	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	// Outputs
	wire [3:0] s;
	wire c3;

	// Instantiate the Unit Under Test (UUT)
	cla_adder uut (.a(a), .b(b), .cin(cin), .s(s), .c3(c3));

	initial begin
		a = 4'b1010; b = 4'b0001; cin = 0;
		#10 a = 4'b0010; b = 4'b0101; cin = 1;
		#10 a = 4'b1110; b = 4'b0001; cin = 1;
		#10 a = 4'b1000; b = 4'b0011; cin = 1;
		#10 a = 4'b0010; b = 4'b0101; cin = 0;
		#10 a = 4'b1100; b = 4'b0101; cin = 1;
		#10 a = 4'b1010; b = 4'b1001; cin = 0;
		#10 a = 4'b1010; b = 4'b0011; cin = 1;
		#10 a = 4'b1010; b = 4'b0100; cin = 1;
		#10 a = 4'b1010; b = 4'b1011; cin = 1;
		#10 $finish;
	end
      
endmodule
