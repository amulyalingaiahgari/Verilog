module tb;
reg [3:0]num_in;
reg sel;
wire [3:0]num_out;
compliment dut (num_out, sel, num_in);
initial
begin
  sel=0;
  num_in=4;
  #5 sel=1;
  #5 num_in=6;
  #5 sel=0;
  #5 sfinish;
end
endmodule
