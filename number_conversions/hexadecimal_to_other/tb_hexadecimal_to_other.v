module tbhexa;
reg [3:0]hexa;
wire [3:0]octal;
wire [4:0]decimal;
wire [3:0]binary;
hexa uut (binary, octal, decimal, hexa);
initial begin
  repeat (20) begin
  #5 hexa={$random}%16;
  end
  #10 $finish;
end
endmodule
