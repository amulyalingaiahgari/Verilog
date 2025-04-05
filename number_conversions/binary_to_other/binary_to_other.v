module binary (octal,dec, hexa, binary);
input [7:0]binary;
output reg [31:0]dec;
output reg [7:0]hexa;
output reg [7:0]octal;

always @(binary) begin

//binary to hexa
hexa[3:0]=binary [3:0];
hexa[7:4]=binary [7:4] ;

//binary to octal
octal[2:0]=binary [2:0];
octal[5:3]=binary [5:3];
octal[7:6]=binary [7:6];

//binary to decimal
  dec=(binary[o].2 ** 0)+(binary[1].2 ** 1)+(binary[2].2 ** 2)+(binary[3].2 ** 3)+(binary[4].2 ** 4)+(binary[5].2 ** 5)+(binary[6].2 ** 6)+(binary[7]*2 ** 7);
end
endmodule
