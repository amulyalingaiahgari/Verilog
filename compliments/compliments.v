module compliment (num_out, sel, num_in);
input [3:0]num_in;
input sel;
output reg [3:0]num_out;
always @(*) begin
  if(sel) begin
    num_out=(-num_in)+1;
  end
  else begin
    num_out =- num_in;
  end
end
endmodule
