module octal (binary, dec, hexa, octal);
input [2:0]octal;
output reg [3:0]binary;
output reg [3:0]dec;
output reg[3:0]hexa;

always @(octal) begin

//octal to binary
binary={0, octal};
//octal to decimal
dec=octal;
//octal to hexadecimal
hexa=octal;
end
endmodule
