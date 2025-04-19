module siso (data_out, clk, rst, data_in);
input clk;
input rst;
input data_in;
output reg data_out;
reg [3:0] shift_reg;
always @(posedge clk) begin
if (rst)begin
shift_reg <= 0;
data_out <= 0;
end
else begin
shift_reg <= {data_in, shift_reg[3:1]};
data_out <= shift_reg[0];
end
end
endmodule
