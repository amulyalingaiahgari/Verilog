module h5(
  input clk,
  input rst,
  output reg [2:0]y ); //output reg[3:0]y); //for hoilding 8
  reg count; //reg [1:0]count;

  always @(posedge clk) begin
    if(rst) begin
      y <= 0;
      count <= 0;
    end
    else begin
      if(y == 5 && !count) //if(y==8 && count<2)
        count <= ~count; //count<=count+1;
      else if(y == 5 && count) begin // (y==8 && count==2)
        count <= 0;
        y=y+1;
      end
      else
        y=y+1;
    end
  end
endmodule
