module piso (data_out, clk, rst, data_in, load) ;
input clk;
input rst;
input [3:0]data_in;
input load;
output reg data_out;

reg [3:0]shift_reg;
always @(posedge clk) begin
if(rst)begin
shift_reg <= 0;
data_out <= 0;
end
else if (load) begin
shift_reg <= data_in;
data_out <= shift_reg[0];
end
else begin
shift_reg <= {1'b0,shift_reg[3:1]};
data_out <= shift_reg[0];
end
end
endmodule
