// Binary to Gray Code Converter
module binary_to_gray #(parameter N = 4)(
    input  [N-1:0] bin,
    output [N-1:0] gray
);
    assign gray = bin ^ (bin >> 1);
endmodule



/*module b_to_g(b,g);
    input [3:0] b;
    output [3:0] g;

	assign g[3] = b[3];
	xor x1(g[2],b[3],b[2]);
	xor x2(g[1],b[2],b[1]);
	xor x3(g[0],b[1],b[0]);
endmodule
*/
