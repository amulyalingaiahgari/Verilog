`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05/04/2025
// Design Name:   Gates using nand
// Module Name:   tb_gates_using_nand.v
// Project Name:  Gates using nand
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gates using nand
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gates_using_nand_tb;
	// Inputs
	reg a;
	reg b;
	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	gates_using_nand uut (
		.a(a), 
		.b(b), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#10;        
		// Add stimulus here
		a = 0;
		b = 1;
		#10; 
		a = 1;
		b = 0;
		#10;       
		a = 1;
		b = 1;
		#10;      		 
	end
	initial 
		begin
			$monitor("a=%b,b=%b,y=%b",a,b,y);
		end      
endmodule
