module tb_binary;
reg [7:0]binary;
wire [7:0]dec;
wire [7:0]hexa;
wire [7:0]octal;
binary dut (octal, dec, hexa, binary);
initial
begin
binary=8'b00101010;
#10 binary=8'b10100010;
#10 binary=8'b11011001;
#10 binary=8'b11110011;
#10 $finish;
end
endmodule
