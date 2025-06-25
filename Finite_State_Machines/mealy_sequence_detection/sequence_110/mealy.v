module mealy (
  input clk,
  input rst,
  input data_in,
  output reg data_out );
  reg [1:0]state;
  reg [1:0]next_state;
  
  parameter s0=2'b00,
            s1=2'b01,
            s2=2'b10;

  always @(posedge clk) begin
    if(rst)
      state <= s0;
    else
      state <= next_state;
  end
  
  always @(state,data_in) begin
    case (state)
      s0:begin
        data out <= 0;
        if(data_in)
          next_state <= s1;
        else
          next_state <= s0;
      end
      sl:begin
        data_out <= 0;
        if(data_in)
          next_state <= s2;
        else
          next_state <= s0;
      end
      s2:begin
        if(data_in)begin
          data_out <= 0;
          next_state <= s2;
        end
        else begin
          data_out<=1;
          next_state<=s0;
        end
      end
      default:begin
        state<=s0;
      end
    endcase
  end
endmodule
