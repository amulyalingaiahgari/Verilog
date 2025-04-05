module hexa (binary, octal, decimal, hexa);
input [3:0]hexa;
output reg [3:0]binary;
output reg [3:0]octal;
output reg [4:0]decimal;
always @(*) begin
binary=hexa;
case (hexa)
4'h0: octal=4'o0;
4'h1: octal=4'o1;
4'h2: octal=4'o2;
4'h3: octal=4'o3;
4'h4:octal=4'o4;
4'h5: octal=4'o5;
4'h6:octal=4'o6;
4'h7:octal=4'o7;
4'h8:octal=4'o10;
4'h9:octal=4'o11;
4'ha: octal=4'o12;
4'hb: octal=4'o13;
4'hc:octal=4'o14;
4'hd: octal=4'o15;
4'he: octal=4'o16;
4'hf:octal=4'o17;
default:octal=4'00;
endcase
case (hexa)
4'h0 : decimal=5'd0;
4'h1 : decimal=5'd1;
4'h2 : decimal=5'd2;
4'h3 : decimal=5'd3;
4'h4:decimal=5'd4;
4'h5: decimal=5'd5;
4'h6:decimal=5'd6;
4'h7 : decimal=5'd7;
4'h8:decimal=5'd8;
4'h9: decimal=5'd9;
4'ha:decimal=5'd10;
4'hb: decimal=5'd1l;
4'hc:decimal=5'd12;
4'hd: decimal=5'd13;
4'he:decimal=5'd14;
4'hf :decimal=5'd15;
default:decimal=5'd0;
endcase
end
endmodule 
