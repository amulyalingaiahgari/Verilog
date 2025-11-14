module synchronous_counter #(parameter SIZE=4)(
  input clk, rst_n,
  input up_down,
  output reg [size-1:0] count);

  always @(posedge clk) begin
    if(!rst_n) begin
      count <= 4'h0;
    end
    else begin
      if(up_down) 
        count <= count + 1'b1;//count up
      else 
        count <= count - 1'b1;//count down
    end
  end
endmodule
