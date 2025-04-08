module de8 (d_out, d_in, enable);
input [2:0]d_in;
input enable;
output reg [7:0]d_out;
  
always @(d_in or enable)
begin
if (enable)
d_out <= d_in;
else
d_out <= 8'bx;
end
  
endmodule
