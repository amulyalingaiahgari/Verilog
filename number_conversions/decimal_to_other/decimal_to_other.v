module dec (binary, octal, hexa, decimal);
input [3:0]decimal;
output reg [3:0]hexa;
output reg [3:0]octal;
output reg [3:0]binary;
always @(.) begin
binary=decimal;
hexa=decimal;
case (decimal)
4'do:octal=4'do;
4'dl: octal=4'dl;
4'd2: octal=4'd2;
4'd3: octal=4'd3;
4'd4: octal=4'd4;
4'd5: octal=4'd5;
4'd6: octal=4'd6;
4'd7: octal=4'd7B
4'd8:octal=4'd10;
4'd9: octal=4'd11;
default: octal=4'do;
endcase
end
endmodule
