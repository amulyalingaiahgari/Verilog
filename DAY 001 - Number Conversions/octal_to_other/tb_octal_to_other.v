module tboctal;
reg [2:0]octal;
wire [3:0]dec;
wire [3:0]hexa;
wire [3:0]binary;
octal dut (binary, dec, hexa, octal);
initial
begin
octal=2;
#10 octal=5;
#10 octal=7;
#10 octal=4;
#10 sfinish;
end
endmodule
