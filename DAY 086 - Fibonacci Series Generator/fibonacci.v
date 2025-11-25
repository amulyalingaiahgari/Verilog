module fibonacci(
  input clk,rst,
  output reg [31:0] present,next 
);
  always @(posedge clk) begin
    if(rst)
      begin
        present <= 0;
        next <=1;
      end
    else begin
      {present,next} <= {next,present+next};
    end
  end
endmodule
