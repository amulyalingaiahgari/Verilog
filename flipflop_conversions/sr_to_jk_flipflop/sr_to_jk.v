module sr_jk (q,clk, rst,j,k);
  input clk;
  input rst;
  input j,k;
  output reg q;
  reg s,r;

  always @(*) begin
    case({j,k})
      2'b00:begin
        s=0;r=0;//no change
      end
        2'b01:begin
          s=0;r=1;//reset
        end
          2'b10:begin
            s=1;r=0;//set
          end
            2'b11:begin
              s=1;r=1;
            end
              default:begin
                s=0;r=0;
              end
                endcase
      end
//sr flipflop behaviour
  always @ (posedge clk) begin
    if(rst)
      q <= 0;
    else begin
      if(s && !r)
        q <= 1;//set q to 1
      else if(r && !s)
        q<=0;//reset q to 0
      else if(s && r)
        q<=~q;//toggle
      else
      q<=q;//memory
    end
  end
endmodule
