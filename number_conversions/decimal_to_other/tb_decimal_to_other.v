module tbdec;
reg [3:0]decimal;
wire [3:0]octal;
wire [3:0]hexa;
wire [3:0]binary;
dec uut (binary, octal, hexa, decimal) ;
initial begin
repeat (20) begin
#5 decimal={$random}%10;
end
#10 $finish;
end
endmodule
