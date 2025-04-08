module en8 (d_out, d_in, enable);
input [7:0]d_in;
input enable;
output reg (2:0]d_out;
            
always @(enable or d_in)
begin
if (enable)
d out <= d_in;
else
d_out <= 3'bx;
end
            
  endmodule
